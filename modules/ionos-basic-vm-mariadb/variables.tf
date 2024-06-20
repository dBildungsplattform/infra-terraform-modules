variable "datacenter_id" {
  type = string
}

variable "coordinates" {
  type = map(any)
}

variable "domain_without_top_level" {
  type = string
  description = "domain without top level"
}

variable "top_level_domain" {
  type        = map(any)
  description = "Top-level domain mapping for environments"
}

variable "ports" {
  type = list
  description = "ports to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port = ???, source_ip = ???}], source_ip is optional."
  default = []
}

variable "datacenter_location" {
  type = string
  description = "Geographic location of the datacenter"
}

variable "fulldomainname" {
  type = string
  description = "Domain under which the basic VM server will be available"
}

variable "ip_pool_name" {
  type = string
  description = "Name of the IP pool"
}

variable "image" {
  type = string
  description = "Image UUID for the VM"
}

variable "basic_vm_server_memory" {
  type = number
  description = "Memory allocated to the VM"
}

variable "basic_vm_server_cpu" {
  type = number
  description = "CPU cores allocated to the VM"
}

variable "cpu_family" {
  type = string
  description = "Type of CPU to use"
}

variable "basic_vm_volume_size" {
  type = number
  description = "Size of the primary volume in GB"
}

variable "basic_vm_second_volume_size" {
  type = number
  description = "Size of the second volume in GB"
}

variable "basic_vm_second_volume_disk_type" {
  type = string
  description = "Disk type of the second volume"
}

variable "server_name" {
  type = string 
  description = "name of the vm"
}
variable "mariadb_version" {
  type = string
  description = "Version of MariaDB to deploy"
}

variable "mariadb_instances_count" {
  type = number
  description = "Number of instances in the MariaDB cluster"
}

variable "mariadb_cores" {
  type = number
  description = "Number of CPU cores per MariaDB instance"
}

variable "mariadb_memory" {
  type = number
  description = "Memory per MariaDB instance in GB"
}

variable "mariadb_storage_size" {
  type = number
  description = "The amount of storage per instance in gigabytes (GB)"
}

variable "mariadb_display_name" {
  type = string
  description = "Display name for the MariaDB cluster"
}

variable "maintenance_day" {
  type = string
  description = "Maintenance day for the MariaDB cluster"
  default = "Sunday"
}

variable "maintenance_hour" {
  type = number
  description = "Hour at which maintenance may start"
  default = 3
}

variable "mariadb_username" {
  description = "The username for the initial mariadb user"
  type = string
}

variable "mariadb_password" {
  description = "The password for the initial mariadb user"
  type = string
}

variable "create_lan" {
  type        = bool
  description = "If true a LAN will be created, if false a LAN ID must be provided"
  default     = true
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