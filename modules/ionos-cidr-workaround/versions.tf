terraform {
  required_providers {
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "~>6.7.22"
    }
  }
  required_version = ">= 0.13"
}