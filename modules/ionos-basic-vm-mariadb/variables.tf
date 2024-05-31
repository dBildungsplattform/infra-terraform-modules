variable "datacenter_id" {
  type = string
  description = "ID of the datacenter where resources will be deployed"
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

variable "server_memory" {
  type = number
  description = "Memory allocated to the VM"
}

variable "server_cpu" {
  type = number
  description = "CPU cores allocated to the VM"
}

variable "cpu_family" {
  type = string
  description = "Type of CPU to use"
}

variable "volume_size" {
  type = number
  description = "Size of the primary volume in GB"
}

variable "second_volume_size" {
  type = number
  description = "Size of the second volume in GB"
}

variable "second_volume_disk_type" {
  type = string
  description = "Disk type of the second volume"
}

variable "server_name" {
  type = string
  description = "Name of the server"
}

variable "mariadb_version" {
  type = string
  description = "Version of MariaDB to deploy"
}

variable "instances_count" {
  type = number
  description = "Number of instances in the MariaDB cluster"
}

variable "cores" {
  type = number
  description = "Number of CPU cores per MariaDB instance"
}

variable "memory" {
  type = number
  description = "Memory per MariaDB instance in GB"
}

variable "display_name" {
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

variable "username" {
  type = string
  description = "Username for the initial MariaDB admin account"
}

variable "password" {
  type = string
  description = "Password for the initial MariaDB admin account"
}

variable "lan_id" {
  type = string
  description = "LAN ID for connecting the VM and MariaDB cluster"
}
