#
# The coordinates of the created infrastructure. Used to identify
# infrastructural pieces distributed over several services or locations
# that belong together.
#
# Examples:
# project=sc, stage=prod, scope=legacy, index="" > sc-prod-legacy
# project=playground, stage=dev, scope=marbarte, index=01 > playground-dev-marbarte-01
#
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
# E.g. "hpi-schul-cloud"
#
variable "domain_without_top_level" {
  type        = string
  description = ""
  default     = "<domain_ingress>"
}

#
# service="scecho", instance_id="feature_OPS_2350", instance_location="marbarte"
#
variable "ingress" {
  type = map(any)
  default = {
    "service"           = "<service>"
    "instance_id"       = "<instance_id>"
    "instance_location" = "<instance_location>"
  }
}

#
# The dns CNAME entry.
# Optional value to overwrite the default generated from the conventions.
# If not set will default to the internal_alias_dns.
#
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
#
# The time to live (TTL) of the record set.
#

variable "ttl" {
  type        = number
  description = " The time to live (TTL) of the record set."
  default     =  300
}

#
# The type of record set. Examples: "A", "MX". Changing this creates a new DNS record set.
#

variable "type" {
  type        = string
  description = " The time to live (TTL) of the record set."
  default     =  "CNAME"
}

 #
  # To delay resource destroy. For example, 30s for 30 seconds or 5m for 5 minutes.
  #
  variable "destroy_duration" {
  type        = string
  description = " Time duration to delay resource creation"
  default     =  "30s"
}