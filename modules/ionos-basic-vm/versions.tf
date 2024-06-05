terraform {
  required_providers {
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "6.4.14"
    }
    opentelekomcloud = {
      source = "opentelekomcloud/opentelekomcloud"
    }
  }
  required_version = ">= 0.13"
}
