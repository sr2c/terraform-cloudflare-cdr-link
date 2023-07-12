variable "client_agent_emails" {
  type = string
}

variable "client_admin_emails" {
  type = string
}

variable "cloudflare_account_id" {
  description = "The account identifier to target for the module."
  type        = string
}

variable "cloudflare_zone_id" {
  description = "The zone identifier to target for the module."
  type        = string
}

variable "labelstudio_access_roles" {
  type = string
  default = "admin,monitoring"
}

variable "metamigo_access_roles" {
  type = string
  default = "admin,monitoring"
}


variable "labelstudio_domain" {
  description = <<EOT
    The domain name for the Label Studio user interface. Do not include a tailing dot at the end of the domain name. Only
    the user interface for Label Studio is exposed, all other communication happens internally within the Docker network.
    By default, the domain name will be formed of `$${environment}-ls.$${cloudflare_zone_name}`. The zone name is
    retrieved from Cloudflare based on the Zone ID.
  EOT
  type        = string
  default     = null
}

variable "metamigo_domain" {
  description = <<EOT
    The domain name for the Metamigo user interface. Do not include a tailing dot at the end of the domain name. Only
    the user interface for Metamigo is exposed, all other communication happens internally within the Docker network.
    By default, the domain name will be formed of `$${environment}-admin.$${cloudflare_zone_name}`. The zone name is
    retrieved from Cloudflare based on the Zone ID.
  EOT
  type        = string
  default     = null
}

variable "super_admins_group_ids" {
  type = string
}

variable "zammad_access_roles" {
  type = string
  default = "admin,agent,leafcutter,monitoring"
}

variable "zammad_domain" {
  description = <<EOT
    The domain name for the Zammad user interface. Do not include a tailing dot at the end of the domain name.
    By default, the domain name will be formed of `$${environment}.$${cloudflare_zone_name}`. The zone name is
    retrieved from Cloudflare based on the Zone ID.
  EOT
  type        = string
  default     = null
}
