#
# The coordinates of the created infrastructure. Used to identify
# infrastructural pieces distributed over several services or locations
# that belong together.
#
# Examples:
#project=sc, stage=prod, scope=schulcloud, index="" > sc-prod-schulcloud
#project=infra, stage=dev, scope=schulcloud, index=01 > infra-dev-schulcloud-01

variable "coordinates" {
  type = map(any)
  default = {
    "project" = "<project_ingress>"
    "stage"   = "<stage_ingress>"
    "scope"   = "<scope_ingress>"
    "index"   = "<index_ingress>"
  }
}
#
# The domain, without top level.
# E.g. "dBildungsplattform"
#
variable "domain_without_top_level" {
  type        = string
  description = "The domain, without top level"
  default     = "dBildungsplattform"
}
#
# Top-level domain mapping for environments
#
variable "top_level_domain" {
  description = "Top-level domain mapping for environments"
  type        = map(string)
  default = {
    "prod"    = "de"
    "staging" = "de"
    "test"    = "de"
    "dev"     = "de"
  }
}

#
# The dns CNAME entry.
# Optional value to overwrite the default generated from the conventions.
# If not set will default to the internal_alias_dns.

variable "dns_a_entry" {
  type        = string
  description = "The dns A entry this CNAME will point to."
  default     = ""
}

variable "dns_aliases" {
  type        = list(string)
  description = "Extra aliases"
  default     = []
}



/* #
# service="scecho", instance_id="feature_OPS_2350", instance_location="marbarte"
#
variable "ingress" {
  type = map(any)
  default = {
    "service"           = "<service>"
    "instance_id"       = "<instance_id>"
    "instance_location" = "<instance_location>"
  }
} */

