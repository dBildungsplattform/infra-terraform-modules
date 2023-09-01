
### - variables -----------------------------------
#
# Display Name of an existing cluster that you want to search for.
#
variable "display_name" {
  description = "Display Name of an existing cluster that you want to search for."
  type        = string
}
#
# The PostgreSQL version of your cluster.
#
variable "postgres_version" {
  description = "The PostgreSQL version of your cluster."
  type        = string
}
#
# The total number of instances in the cluster (one master and n-1 standbys)
#
variable "instances_count" {
  description = "The total number of instances in the cluster (one master and n-1 standbys)"
  type        = number
}
#
# The number of CPU cores per replica.
#
variable "cores" {
  description = "The number of CPU cores per replica."
  type        = number
}
#
# The amount of memory per instance in megabytes.
#
variable "memory" {
  description = "The amount of memory per instance in megabytes."
  type        = number
}
#
# The amount of memory per instance in megabytes.
#
variable "volume_size" {
  description = "The amount of storage per instance in MB."
  type        = number
}
#
# The storage type used in your cluster. (Default: SSD)
#
variable "volume_disk_type" {
  description = "The storage type used in your cluster. (Default: SSD)"
  type        = string
  default     = "SSD"
}
#
# The datacenter to connect your cluster to.
#
variable "datacenter_id" {
  description = "The datacenter to connect your cluster to."
  type        = string
}
#
# The physical location where the cluster will be created. This will be where all of your instances live.
#
variable "datacenter_location" {
  description = "The physical location where the cluster will be created. This will be where all of your instances live."
}
#
# ID of cluster
#
variable "k8s_cluster_id" {
  description = ""
  type        = string
}
#
# The LAN to connect your cluster to.
#
variable "lan_id" {
  description = "The LAN to connect your cluster to."
  type        = string
}
#
# The subnet mask to use for allowing connections from the LAN. (Default: 16)
#
variable "subnet_mask" {
  description = "The subnet mask to use for allowing connections from the LAN. (Default: 16)"
  type        = string
  default     = 16
}
#
# The number to be set in the last ip block. (Default: 101)
#
variable "ip_block" {
  description = "The number to be set in the last ip block. (Default: 101)"
  type        = number
  default     = 101
}
#
# The username for the initial postgres user.
#
variable "username" {
  description = "The username for the initial postgres user."
  type        = string
}
#
# The password for the initial postgres user.
#
variable "password" {
  description = "The password for the initial postgres user."
  type        = string
}
#
# The day of the week for the 4 hour-long maintenance window
#
variable "maintenance_day" {
  description = "The day of the week for the 4 hour-long maintenance window. (Default: Sunday)"
  type        = string
  default     = "Sunday"
}
#
# The time of the day when the 4 hour-long maintenance window may start
#
variable "maintenance_hour" {
  description = "The time of the day when the 4 hour-long maintenance window may start. (Default: 3)"
  type        = number
  default     = 3
}
#
# Represents different modes of replication
#
variable "synchronization_mode" {
  description = "Represents different modes of replication. Can have one of the following values: ASYNCHRONOUS, SYNCHRONOUS, STRICTLY_SYNCHRONOUS. This attribute is immutable(disallowed in update requests). (Default: ASYNCHRONOUS)"
  type        = string
  default     = "ASYNCHRONOUS"
}
