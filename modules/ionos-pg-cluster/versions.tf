terraform {
  required_providers {
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "~> 6.7.33"
    }
  }
  required_version = ">= 0.13"
}
