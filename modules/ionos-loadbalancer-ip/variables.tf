variable "coordinates" {
  type = map(any)
}
variable "top_level_domain" {
  description = "Top-level domain mapping for environments"
  type        = map(any)
}
variable "domain_without_top_level" {
  type        = string
  description = "domain without top level"
}
variable "datacenter_location" {
  type        = string
  description = "Location of datacenter cluster shall be created in"
}
# Select between different ingress controller configurations.
# sclb:
# - schul-cloud load balancer.
# nodeport:
# - The ingress controller provides a nodeport on each node. 
#   This is the classic configuration used in sc-prod-schulcloud, where an external
#   haproxy connects to each node round robin.
# Default: sclb
variable "ingress_mode" {
  type        = string
  description = "Set to one of 'sclb' or 'nodeport'."
  default     = "sclb"
}


