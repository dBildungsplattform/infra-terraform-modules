variable "coordinates" {
  type = map(any)
  default = {
    "project" = "<project_ingress>"
    "stage"   = "<stage_ingress>"
    "scope"   = "<scope_ingress>"
    "index"   = "<index_ingress>"
  }
}

# hpi-schul-cloud
variable "domain_without_top_level" {
  type        = string
  description = ""
  default     = "<domain_ingress>"
}

#
# Needed to book the ip (crip) for DNS registration.
#
variable "datacenter_location" {
  type        = string
  description = "Location of datacenter cluster shall be created in."
  default     = ""
}

#
# Select between different ingress controller configurations.
#
# sclb:
# - schul-cloud load balancer.
#
# nodeport:
# - The ingress controller provides a nodeport on each node. 
#   This is the classic configuration used in sc-prod-legacy, where an external
#   haproxy connects to each node round robin.
#
# Default: sclb
#
variable "ingress_mode" {
  type        = string
  description = "Set to one of 'sclb' or 'nodeport'."
  default     = "sclb"
}

#
# The number of IP addresses to reserve for this block
#
variable "size" {
  type        = number
  description = "The number of IP addresses to reserve for this block."
  default     = 1
}

#
# To delay resource destroy. For example, 30s for 30 seconds or 5m for 5 minutes.
#
variable "destroy_duration" {
  type        = string
  description = " Time duration to delay resource creation"
  default     =  "30s"
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
  default     =  "A"
}
