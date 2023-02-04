module "example" {
  source = "./../.."

  namespace   = "cdr"
  name        = "link"
  environment = "shockwave"
  stage       = "dev"

  cloudflare_account_id = "05a97133d8e9558c23f5a8219c0ef01f"
  cloudflare_zone_id = "d8d45e47f9c1c42c749b47c9eea6ba58"

  client_admin_emails   = "example-admin@digiresilience.org"
  client_agent_emails   = "example-agent@digiresilience.org"
  super_admins_group_ids = "f09df383-2854-4d3f-9a87-455f690e7f9a,94c3863c-4c4b-4f9b-9783-069ded04b038"
}
