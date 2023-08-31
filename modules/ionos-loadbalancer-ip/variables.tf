
### - variables -----------------------------------
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
# Example: dBildungsplattform
#
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
#   This is the classic configuration used in sc-prod-schulcloud, where an external
#   haproxy connects to each node round robin.
#
# Default: sclb
#
variable "ingress_mode" {
  type        = string
  description = "Set to one of 'sclb' or 'nodeport'."
  default     = "sclb"
}

