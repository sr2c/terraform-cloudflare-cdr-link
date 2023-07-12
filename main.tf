locals {
  access_applications = {
    (local.zammad_domain) = {
      domain = local.zammad_domain
      name   = "${module.this.id} :: CDR Link"
      roles  = split(",", var.zammad_access_roles)
    }
    (local.metamigo_domain) = {
      domain = local.metamigo_domain
      name   = "${module.this.id} :: Metamigo"
      roles  = split(",", var.metamigo_access_roles)
    }
    (local.labelstudio_domain) = {
      domain = local.labelstudio_domain
      name   = "${module.this.id} :: LabelStudio"
      roles  = split(",", var.labelstudio_access_roles)
    }
  }
  access_overrides = {
    "${local.zammad_domain}/api/v1/sms_webhook/" = {
      domain = "${local.zammad_domain}/api/v1/sms_webhook/"
      name   = "${module.this.id} :: Twilio SMS"
    }
    "${local.zammad_domain}/api/v1/channels_telegram_webhook/" = {
      domain = "${local.zammad_domain}/api/v1/channels_telegram_webhook/"
      name   = "${module.this.id} :: Telegram"
    }
    "${local.zammad_domain}/assets/form/form.js" = {
      domain = "${local.zammad_domain}/assets/form/form.js"
      name   = "${module.this.id} :: Zammad Forms"
    }
    "${local.metamigo_domain}/api/v1/voice/twilio/" = {
      domain = "${local.metamigo_domain}/api/v1/voice/twilio/"
      name   = "${module.this.id} :: Twilio Voice"
    }
  }
  labelstudio_domain   = coalesce(var.labelstudio_domain, "${module.this.tenant}-ls.${data.cloudflare_zone.this.name}")
  metamigo_domain = coalesce(var.metamigo_domain, "${module.this.tenant}-admin.${data.cloudflare_zone.this.name}")
  zammad_domain   = coalesce(var.zammad_domain, "${module.this.tenant}.${data.cloudflare_zone.this.name}")
}

data "cloudflare_access_identity_provider" "google" {
  name       = "Google"
  account_id = var.cloudflare_account_id
}

data "cloudflare_zone" "this" {
  zone_id = var.cloudflare_zone_id
}

resource "random_id" "tunnel_secret" {
  byte_length = 32
}

resource "cloudflare_argo_tunnel" "default" {
  account_id = var.cloudflare_account_id
  name       = module.this.id
  secret     = sensitive(random_id.tunnel_secret.b64_std)
}

resource "cloudflare_record" "tunnel_records" {
  for_each = local.access_applications
  zone_id  = var.cloudflare_zone_id
  name     = each.value.domain
  value    = "${cloudflare_argo_tunnel.default.id}.cfargotunnel.com"
  proxied  = true
  type     = "CNAME"
}

resource "cloudflare_access_application" "default" {
  for_each                  = local.access_applications
  zone_id                   = var.cloudflare_zone_id
  name                      = each.value.name
  domain                    = each.value.domain
  session_duration          = "12h"
  auto_redirect_to_identity = true
  allowed_idps              = [data.cloudflare_access_identity_provider.google.id]
}

resource "cloudflare_access_policy" "allow_super_admins" {
  for_each       = cloudflare_access_application.default
  zone_id        = var.cloudflare_zone_id
  application_id = each.value.id
  name           = "Super Admins"
  precedence     = 1
  decision       = "allow"
  include {
    group = split(",", var.super_admins_group_ids)
  }
}

resource "cloudflare_access_policy" "default_deny" {
  for_each       = cloudflare_access_application.default
  zone_id        = var.cloudflare_zone_id
  application_id = each.value.id
  name           = "Deny Public"
  precedence     = 100
  decision       = "deny"
  include {
    everyone = true
  }
}

resource "cloudflare_access_group" "client_admins" {
  account_id = var.cloudflare_account_id
  name = "${module.this.id} :: Admins"
  include {
    email = split(",", var.client_admin_emails)
  }
}

resource "cloudflare_access_policy" "allow_client_admins" {
  for_each = {
    for k, d in local.access_applications :
    k => d
    if contains(d.roles, "admin")
  }

  zone_id        = var.cloudflare_zone_id
  application_id = cloudflare_access_application.default[each.key].id
  name           = "Client Admins"
  decision       = "allow"
  precedence     = 3
  include {
    group = [
      cloudflare_access_group.client_admins.id
    ]
  }
}

resource "cloudflare_access_group" "client_agents" {
  account_id = var.cloudflare_account_id
  name = "${module.this.id} :: Agents"
  include {
    email = split(",", var.client_agent_emails)
  }
}

resource "cloudflare_access_policy" "allow_agents" {
  for_each = {
    for k, d in local.access_applications :
    k => d
    if contains(d.roles, "agent")
  }

  zone_id        = var.cloudflare_zone_id
  application_id = cloudflare_access_application.default[each.key].id
  name           = "Agents"
  decision       = "allow"
  precedence     = 2
  include {
    group = [
      cloudflare_access_group.client_agents.id
    ]
  }
}

resource "cloudflare_access_service_token" "monitoring" {
  account_id = var.cloudflare_account_id
  name       = "${module.this.id} :: Monitoring"
}

resource "cloudflare_access_policy" "allow_monitoring" {
  for_each = {
    for k, d in local.access_applications :
    k => d
    if contains(d.roles, "monitoring")
  }
  zone_id        = var.cloudflare_zone_id
  application_id = cloudflare_access_application.default[each.key].id
  name           = "Monitoring"
  decision       = "non_identity"
  precedence     = 7
  include {
    service_token = [
      cloudflare_access_service_token.monitoring.id
    ]
  }
}

resource "cloudflare_access_service_token" "leafcutter" {
  account_id = var.cloudflare_account_id
  name       = "${module.this.id} :: Leafcutter"
}


resource "cloudflare_access_policy" "allow_leafcutter" {
  for_each = {
    for k, d in local.access_applications :
    k => d
    if contains(d.roles, "leafcutter")
  }

  zone_id        = var.cloudflare_zone_id
  application_id = cloudflare_access_application.default[each.key].id
  name           = "Leafcutter"
  decision       = "non_identity"
  precedence     = 4
  include {
    service_token = [
      cloudflare_access_service_token.leafcutter.id
    ]
  }
}

resource "cloudflare_access_policy" "allow_public" {
  for_each = {
    for k, d in local.access_applications :
    k => d
    if contains(d.roles, "public")
  }
  zone_id        = var.cloudflare_zone_id
  application_id = cloudflare_access_application.default[each.key].id
  name           = "Public Access"
  decision       = "non_identity"
  precedence     = 5
  include {
    everyone = true
  }
}

resource "cloudflare_access_application" "override" {
  for_each                  = local.access_overrides
  zone_id                   = var.cloudflare_zone_id
  name                      = each.value.name
  domain                    = each.value.domain
  session_duration          = "12h"
  auto_redirect_to_identity = false
}

resource "cloudflare_access_policy" "allow_override" {
  for_each       = local.access_overrides
  zone_id        = var.cloudflare_zone_id
  application_id = cloudflare_access_application.override[each.key].id
  name           = "Override"
  decision       = "bypass"
  precedence     = 5
  include {
    everyone = true
  }
}
