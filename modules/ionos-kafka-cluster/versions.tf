terraform {
  required_providers {
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "~>6.7.23"
    }
  }
  required_version = ">= 0.13"
}
