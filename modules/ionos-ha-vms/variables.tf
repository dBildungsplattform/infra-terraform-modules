variable "datacenter" {
  type = string
}

variable "datacenter_location" {
  type = string
}

variable "server_memory" {
  type        = number
  description = "memory of the vm servers"
}

variable "server_cpu" {
  type        = number
  description = "cpus of the vm servers"
}

variable "volume_size" {
  type        = number
  description = "volume size for vm"
}

variable "create_second_volume" {
  type = bool
  default = true
}

variable "second_volume_disk_type" {
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

variable "image" {
  type = string
  description = "image of the vm"
}

variable "name" {
  type = string 
  description = "name of the ha cluster, used for names the components and the domain"
}

variable "second_volume_size" {
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
  description = "port rangs to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port_start = ???, port_end, source_ip = ???}], source_ip is optional."
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

variable "ha_node_count" {
  type        = number
  description = "Number of VMs/Nodes in the HA Cluster"
  default = 2
}

variable "domain_base" {
  type        = string
  description = "Domains will be <name>[-<index>].<domain_base>"
}

variable "initial_user" {
  type = string
  description = "The initial user to be created via the cloud init script."
  default = ""
}

variable "initial_uid" {
  type = string
  description = "The uid of the initial user created via the cloud init script."
  default = ""
}

variable "initial_public_key" {
  type = string
  description = "The public key of the initial user created via the cloud init script."
  default = ""
}
