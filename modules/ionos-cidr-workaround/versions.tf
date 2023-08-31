
#
#Terraform Configuration Block : Required Providers Block & Required Version Block
#

terraform {
  required_providers {
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "6.3.6"
    }
  }
  required_version = ">= 0.13"
}
