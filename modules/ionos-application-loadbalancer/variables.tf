variable "datacenter_id" {
  type        = string
  description = "ID of datacenter cluster shall be created in"
}

variable "datacenter_location" {
  type        = string
  description = "Location of datacenter cluster shall be created in"
}

variable "datacenter_name" {
  type        = string
  description = "Name of datacenter cluster shall be created in"
}

variable "alb_target_lan_id" {
  type        = string
  description = "The LAN to connect your Application Loadbalancer to"
}

variable "dns_record_name" {
  type        = string
  description = "DNS record name that points to Application Loadbalancer"
}

variable "coordinates" {
  type = map(any)
}

variable "top_level_domain" {
  type        = map(any)
  description = "Top-level domain mapping for environments"
}

variable "domain_without_top_level" {
  type        = string
  description = "Domain without top level"
}

variable "node_alb_lan_ips" {
  type        = list
  description = "List of node and application load balancer lan ips"
}

variable "ssl_cert_ids" {
  type        = list
  description = "List of cert ids of wildcard certificates"
}