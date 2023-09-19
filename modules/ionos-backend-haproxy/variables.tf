variable "coordinates" {
  type = map(any)
}

variable "top_level_domain" {
  type          = map(any)
  description   = "define top level domains"
}

variable "domain_without_top_level" {
  type        = string
  description = "domain without top level"
}

variable "datacenter_name" {
  type        = string
  description = "Name of the datacenter the vm shall be created in"
}

variable "datacenter_id" {
  type        = string
  description = "Id of the datacenter the vm shall be created in"
}

variable "datacenter_location" {
  type        = string
  description = "Location of the datacenter the vm shall be created in"
}

variable "crossconnects" {
  type        = list(string)
  description = "List of crossconnects which should connect to backend haproxy"
}

variable "crossconnect_ips" {
  type        = list(string)
  description = "List of crossconnect ips which should be assigned to backend haproxy nics"
}

variable "ram_size_overwrite" {
  type        = string
  description = "This value overwrites pre-defined environment specific vm sizing"
  default     = ""
}

variable "core_count_overwrite" {
  type        = string
  description = "This value overwrites pre-defined environment specific vm sizing"
  default     = ""
}

variable "image_name" {
  type        = string
  description = "The name of the OS image to use for VMs"
  default = "centos:7"
}

variable "log_volume_size" {
  type        = number
  description = "The size of the logging volue in gigabytes"
  default     = 200
}

variable "cpu_family" {
  type        = string
  description = "The CPU family, like INTEL_SKYLAKE"
  default     = ""
}

variable "routes_map" {
  type = any
  description = "map which links based on the lan id to a list in which the routes in form of of an object ('network'='###' and 'gateway_ip'='###') are saved"
  default = {}
}

variable "ssh_key_path" {
  type = string
  description = "provide the relative path to and file name from your ssh key"
  default = "./ssh-key.pub"
}