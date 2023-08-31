
#
#This is a Terraform configuration file.It specifies 
#that the "ionoscloud" provider is required,with a specific
#source and version. Additionally, it sets the required Terraform 
#version to be 0.13 or higher.
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
