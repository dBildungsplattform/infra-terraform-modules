### - Variables ---------------------------------

#
# The name of the cluster that shall be created.
# E.g. sc-prod-legacy, playground-dev-marbarte-1
#
variable "cluster_name" {
  type        = string
  description = "Kubernetes cluster name."
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes version."
  default     = "1.18.5"
}

variable "core_count" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing."
  default     = null
}

variable "ram_size" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing."
  default     = null
}

variable "cpu_family" {
  type        = string
  description = "Valid cpu family"
  default     = "INTEL_SKYLAKE"
}

variable "associated_lans" {
  description = "The lans as objects in a list [{lan[0] with id and routes_list, lan[1] with id and routes_list}, ...]"
  type = list(object({
    id             = number
    routes_list    = list(any)
  }))
  default = []
}

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
# See:
#   terraform/templates/playground/provider.tf : kubernetes.config_path
#   main.tf: local-exec
#
variable "kube_config_path" {
  type        = string
  description = "Local path kubeconfig.yaml will be put when cluster is created for the first time."
  default     = ""
}


#
# Nodepool
#
variable "node_count" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing."
  default     = null
}

#
# Nodepool
#
variable "nodepool_per_zone_count" {
  type        = number
  description = ""
  default     = 0
}

#
# Nodepool
#
# Public ips zone1. 
# For each nodepool a list of assigned ips can be defined.
# The number of ips must be one more than the desired node count per node pool.
#
variable "public_ip_pool_zone1" {
  type    = list(list(string))
  default = null
}

#
# Nodepool
#
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
#
# Automatically create an IP pool per node pool with node count + 1 ips
#
variable "create_public_ip_pools" {
  type    = bool
  default = false
}


# Maintenance Window 
variable "maintenance_day" {
  type        = string
  description = "On which day to do the maintenance"
  default     = "Saturday"
}

variable "maintenance_hour" {
  type        = number
  description = "On which hour to do the maintenance"
  default     = 3
}

# Restrict access to the K8s API server to these IP(Range)s
variable "api_subnet_allow_list" {
    type = list(string)
    default = null
}

variable "availability_zone" {
  type    = string
  default = "ZONE_1"
}

variable "storage_type" {
    type = string
    default = "SSD" 
}

variable "storage_size" {
    type = number
    default = 100
}



