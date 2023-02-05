output "tunnel_id" {
  value = cloudflare_argo_tunnel.default.id
}

output "tunnel_name" {
  value = cloudflare_argo_tunnel.default.name
}

output "tunnel_secret" {
  value = cloudflare_argo_tunnel.default.secret
}

output "metamigo_audience" {
  value = cloudflare_access_application.default[local.metamigo_domain].aud
}

output "metamigo_domain" {
  value = local.metamigo_domain
}

output "zammad_domain" {
  value = local.zammad_domain
}
