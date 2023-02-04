terraform {
  required_version = ">= 1.3.5"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.33.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }
}