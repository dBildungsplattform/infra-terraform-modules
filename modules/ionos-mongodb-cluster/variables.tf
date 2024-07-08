variable "display_name" {
  description = "Display Name of an existing cluster that you want to search for."
  type        = string
}
variable "mongo_version" {
  description = "The MongoDB version of your cluster."
  type        = string
}
variable "instances_count" {
  description = "The total number of instances (1 master, n-1 fallbacks) in the cluster. Options: 1, 3 (Business) 3, 5, 7 (Enterprise)"
  type        = number
}
variable "shards_count" {
  description = "Number of MongoDB shards (Enterprise only)"
  type        = number
  default     = null
}
variable "resource_template" {
  description = "Name of the IONOS Template to use for resources (except for Enterprise)"
  type        = string
  default     = null
}
variable "cores" {
  description = "The number of CPU cores per node (Enterprise only)"
  type        = number
  default     = null
}
variable "memory" {
  description = "The amount of memory in megabytes per node (Enterprise only)"
  type        = number
  default     = null
}
variable "volume_size" {
  description = "The amount of storage in MB per node (Enterprise only)"
  type        = number
  default     = null
}
variable "volume_disk_type" {
  description = "The storage type used in your cluster (Enterprise only)"
  type        = string
  default     = null
}
variable "datacenter_id" {
  description = "The datacenter to connect your cluster to."
  type        = string
}
variable "datacenter_location" {
  description = "The physical location where the cluster will be created. This will be where all of your instances live."
  type        = string
}
# TODO: Connection to VMs
variable "k8s_cluster_id" {
  description = ""
  type        = string
}
variable "lan_id" {
  description = "The LAN to connect your cluster to."
  type        = string
}
variable "subnet_mask" {
  description = "The subnet mask to use for allowing connections from the LAN (Default: 24)"
  type        = string
  default     = 24
}
variable "ip_block_start" {
  description = "The starting number to be set in the last ip block (Default: 101)"
  type        = number
  default     = 101
}
variable "username" {
  description = "The username for the initial mongo user"
  type        = string
}
variable "password" {
  description = "The password for the initial mongo user"
  type        = string
}
variable "role" {
  description = "The role of the initial mongo user (Default: dbAdminAnyDatabase)"
  type        = string
  default     = "dbAdminAnyDatabase"
}
variable "maintenance_day" {
  description = "The day of the week for the 4 hour-long maintenance window (Default: Sunday)"
  type        = string
  default     = "Sunday"
}
variable "maintenance_hour" {
  description = "The time of the day when the 4 hour-long maintenance window may start. (Default: 3)"
  type        = number
  default     = 3
}
