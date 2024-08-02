variable "datacenter_id" {
  description = "The Datacenter id"
  type = string
}

variable "name" {
  description = "The name given for the module"
  type = string
}

variable "server_id" {
    description = "The Server id for the lan"
    type = string
}

variable "ports" {
  description = "List of Ports toprovided to rule"
  type = list
}

variable "is_public" {
  description = "The Type of lan is public (true) or private (false)"
  type = bool
  default = false
}

variable "dhcp_enabled" {
  description = "The DHCP is used (true) or not (false)"
  type = bool
  default = true
}