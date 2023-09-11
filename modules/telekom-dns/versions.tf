terraform {
  required_version = ">= 0.13"

  required_providers {
    opentelekomcloud = {
      source = "opentelekomcloud/opentelekomcloud"
    }
    time = {
      source = "hashicorp/time"
    }
  }
}
