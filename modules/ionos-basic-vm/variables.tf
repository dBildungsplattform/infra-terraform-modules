variable "datacenter" {
  type = string
}

variable "datacenter_location" {
  type = string
}

variable "fulldomainname" {
  type        = string
  description = "Domain under which the basic vm server will be available"
}

variable "create_ip_pool" {
  type        = bool
  description = "If true an IP pool of size 1 will be created, if false a public IP must be provided"
  default     = true
}

variable "public_ip" {
  type        = string
  default     = ""
}

variable "ip_pool_name" {
  type        = string
  description = "Name of the ip pools"
  default     = ""
}

variable "basic_vm_server_memory" {
  type        = number
  description = "memory of the basic vm servers"
}

variable "basic_vm_server_cpu" {
  type        = number
  description = "cpu of the basic vm servers"
}

variable "basic_vm_volume_size" {
  type        = number
  description = "volume size for vm"
}

variable "basic_vm_create_second_volume" {
  type = bool
  default = true
}

variable "basic_vm_second_volume_disk_type" {
  type = string
  default = "HDD"
}

variable "cpu_family" {
  type = string
}

variable "coordinates" {
  type = map(any)
}

variable "top_level_domain" {
  type        = map(any)
  description = "Top-level domain mapping for environments"
}

variable "domain_without_top_level" {
  type = string
  description = "domain without top level"
}

variable "dns_zone_name_override" {
  type = string
  description = "Name of the DNS zone if it doesn't follow the naming convention (i.e. messenger.schule)"
  default = ""
}

variable "image" {
  type = string
  description = "image of the vm"
}

variable "server_name" {
  type = string 
  description = "name of the vm"
}

variable "basic_vm_second_volume_size" {
  type = string 
  description = "size of the second volume"
  default = 100
}

variable "ports" {
  type = list
  description = "ports to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port = ???, source_ip = ???}], source_ip is optional."
  default = []
}

variable "port_ranges" {
  type = list
  description = "port rangs to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port_start = ???, port_end = ???, source_ip = ???}], source_ip is optional."
  default = []
}

variable "permanent_vm" {
  type = bool
  description = "Create a permanent VM that mustn't be deleted, if false then a VM that can be deleted and that ignores changes to ram and cpu is created"
  default = true
}

variable "user_data_script" {
  type = string
  description = "Decide which user-data.sh script to use"
  default = "user-data-cloud-init.tpl"
}

variable "availability_zone" {
  type = string
  description = "Possible Zones: AUTO, ZONE_1, ZONE_2"
  default = "AUTO"
}

variable "create_lan" {
  type        = bool
  description = "If true a LAN will be created, if false a LAN ID must be provided"
  default     = true
}

variable "lan_id" {
  type = number
  description = "Id of the LAN to use (only necessary if create_lan is false)"
  default = null
}

variable "additional_ips" {
  type = list(string)
  description = "Additional IPs for the VM (optional)"
  default = []
}