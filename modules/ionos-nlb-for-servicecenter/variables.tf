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

variable "nlb_target_lan_id" {
  type        = string
  description = "The LAN to connect your Network Loadbalancer to"
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

variable "node_nlb_lan_ips" {
  type        = list
  description = "List of node and network loadbalancer lan ips"
}

variable "nlb_listener_port" {
  type        = number
  description = "Listening (inbound) port number"
}

variable "nlb_target_port" {
  type        = string
  description = "The port of the balanced target service; valid range is 1 to 65535 used in target group"
}

variable "nlb_target_health_check_timeout" {
  type        = string
  description = "The maximum time in milliseconds to wait for the client to acknowledge or send data"
  default     = 6000
}

variable "listener_ips" {
  type        = list(string)
  description = "List of listener ips which should be assigned to nlb listener ip list"
}

variable "crossconnects" {
  type        = list(string)
  description = "List of crossconnects which should connect to backend haproxy"
}


