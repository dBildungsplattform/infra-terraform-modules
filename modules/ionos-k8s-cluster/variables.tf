### - Variables ---------------------------------

#
# The name of the cluster that shall be created.
# E.g. sc-prod-schulcloud
#
variable "cluster_name" {
  type        = string
  description = "Kubernetes cluster name."
}
#
# The desired Kubernetes Version
#
variable "k8s_version" {
  type        = string
  description = "Kubernetes version."
  default     = "1.24.15"
}
#
# The CPU cores count for each node of the node pool
#
variable "core_count" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing."
  default     = null
}
#
# The desired amount of RAM, in MB. This attribute is immutable.
#
variable "ram_size" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing."
  default     = 8192
}
#
# The desired CPU Family
#
variable "cpu_family" {
  type        = string
  description = "Valid cpu family"
  default     = "INTEL_SKYLAKE"
}
#
# A list of numeric LAN id's you want this node pool to be part of
#
variable "associated_lans" {
  description = "The lans as objects in a list [{lan[0] with id and routes_list, lan[1] with id and routes_list}, ...]"
  type = list(object({
    id             = number
    routes_list    = list(any)
  }))
  default = []
}
#
# A Datacenter's UUID
#
variable "datacenter_id" {
  type        = string
  description = "ID of datacenter cluster shall be created in."
}
#
# Via the datacenter location the available CPU type is controlled.
# The actual location is already is already fixed, because the datacenter_id is used.
#
variable "datacenter_location" {
  type        = string
  description = ""
  default     = ""
}
#
# The desired number of nodes in the node pool
#
variable "node_count" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing."
  default     = 1
}
#
# The desired number of nodes
#
variable "nodepool_per_zone_count" {
  type        = number
  description = ""
  default     = 0
}
# 
# Nodepool
# Public ips zone1. 
# For each nodepool a list of assigned ips can be defined.
# The number of ips must be one more than the desired node count per node pool.
#
variable "public_ip_pool_zone1" {
  type    = list(list(string))
  default = null
}

# 
#Nodepool
# Public ips zone2.
# For each nodepool a list of assigned ips can be defined.
# The number of ips must be one more than the desired node count per node pool.
#
variable "public_ip_pool_zone2" {
  type    = list(list(string))
  default = null
}
#
# Nodepool
# Automatically create an IP pool per node pool with node count + 1 ips
#
variable "create_public_ip_pools" {
  type    = bool
  default = false
}
#
# On which day to do the maintenance
#
variable "maintenance_day" {
  type        = string
  description = "On which day to do the maintenance"
  default     = "Saturday"
}
#
# On which hour to do the maintenance
#
variable "maintenance_hour" {
  type        = number
  description = "On which hour to do the maintenance"
  default     = 3
}
#
# Restrict access to the K8s API server to these IP(Range)s
#
variable "api_subnet_allow_list" {
    type = list(string)
    default = null
}
#
# The desired Compute availability zone
#
variable "availability_zone" {
  type    = string
  default = "ZONE_1"
}
#
# The desired storage type - SSD/HDD. This attribute is immutable.
#
variable "storage_type" {
    type = string
    default = "SSD" 
}
#
# The size of the volume in GB. The size should be greater than 10GB. This attribute is immutable.
#
variable "storage_size" {
    type = number
    default = 100
}



