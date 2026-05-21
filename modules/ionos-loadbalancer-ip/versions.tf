terraform {
  required_version = ">= 0.13"

  required_providers {
    opentelekomcloud = {
      source = "opentelekomcloud/opentelekomcloud"
    }
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "~>6.4"
    }
  }
}
