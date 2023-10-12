terraform {
  required_providers {
    opentelekomcloud = {
      version = "1.24.6"
      source  = "opentelekomcloud/opentelekomcloud"
    }
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "6.3.6"
    }
  }
}
