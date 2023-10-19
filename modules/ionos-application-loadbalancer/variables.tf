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
  description = "Array of certificate ids. You can create certificates with the certificate resource"
}

variable "alb_client_timeout" {
  type        = number
  description = "The maximum time in milliseconds to wait for the client to acknowledge or send data; default is 50,000 (50 seconds)"
  default     = 6000
}

variable "alb_listener_port" {
  type        = number
  description = "Listening (inbound) port number; valid range is 1 to 65535"
  default     = 443
}

variable "alb_target_port" {
  type        = string
  description = "The port of the balanced target service; valid range is 1 to 65535 used in target group"
  default     = 30080
}

variable "alb_target_health_check_timeout" {
  type        = string
  description = "The maximum time in milliseconds to wait for the client to acknowledge or send data; default is 50,000 (50 seconds)"
  default     = 6000
}

variable "alb_target_http_health_check_path" {
  type        = string
  description = "The maximum time in milliseconds to wait for the client to acknowledge or send data; default is 50,000 (50 seconds)"
  default     = "/healthz"
}