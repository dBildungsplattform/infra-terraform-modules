variable "mariadb_version" {
  description = "The MariaDB version of your cluster"
  type        = string
}
variable "instances_count" {
  description = "The total number of instances in the cluster (one primary and n-1 secondary)"
  type        = number
}
variable "cores" {
  description = "The number of CPU cores per instance"
  type        = number
}
variable "memory" {
  description = "The amount of memory per instance in gigabytes (GB)"
  type        = number
}
variable "volume_size" {
  description = "The amount of storage per instance in gigabytes (GB)"
  type        = number
}
variable "display_name" {
  description = "The friendly name of your cluster"
  type        = string
}
variable "maintenance_day" {
  description = "The day of the week for the 4 hour-long maintenance window. (Default: Sunday)"
  type        = string
  default     = "Sunday"
}
variable "maintenance_hour" {
  description = "The time of the day when the 4 hour-long maintenance window may start. (Default: 3)"
  type        = number
  default     = 3
}

variable "username" {
  description = "The username for the initial MariaDB user"
  type        = string
}
variable "password" {
  description = "The password for the initial MariaDB user"
  type        = string
}
variable "k8s_cluster_id" {
  description = ""
  type        = string
}
variable "lan_id" {
  description = "The LAN to connect your cluster to."
  type        = string
}
variable "datacenter_id" {
  description = "The datacenter to connect your cluster to."
  type        = string
}
variable "ip_block" {
  description = "The number to be set in the last ip block. (Default: 101)"
  type        = number
  default     = 101
}
variable "subnet_mask" {
  description = "The subnet mask to use for allowing connections from the LAN. (Default: 16)"
  type        = string
  default     = 16
}