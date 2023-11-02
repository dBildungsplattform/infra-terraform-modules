variable "cluster_name" {
  type        = string
  description = "Kubernetes cluster name"
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.24.15"
}

variable "core_count" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing"
}

variable "ram_size" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing"
}

variable "cpu_family" {
  type        = string
  description = "Valid cpu family"
  default     = "INTEL_SKYLAKE"
}

variable "associated_lans" {
  description = "The lans as objects in a list [{lan[0] with id and routes_list, lan[1] with id and routes_list}, ...]"
  type = list(object({
    id          = number
    routes_list = list(any)
  }))
  default = []
}

variable "datacenter_id" {
  type        = string
  description = "ID of datacenter cluster shall be created in"
}

variable "datacenter_location" {
  type        = string
  description = ""
}

variable "node_count" {
  type        = number
  description = "This value overwrites specific k8s cluster sizing"
}

variable "nodepool_per_zone_count" {
  type        = number
  description = ""
  default     = 0
}

variable "public_ip_pool_zone1" {
  type    = list(list(string))
  default = null
}

variable "public_ip_pool_zone2" {
  type    = list(list(string))
  default = null
}

variable "create_public_ip_pools" {
  type    = bool
  default = false
}

variable "allow_node_pool_replacement" {
  type    = bool
  description = "When set to true, allows the update of immutable fields by first destroying and then re-creating the node pool."
  default = false
}

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

variable "api_subnet_allow_list" {
  type    = list(string)
  default = null
}

variable "availability_zone" {
  type    = string
  default = "ZONE_1"
}

variable "storage_type" {
  type    = string
  default = "SSD"
}

variable "storage_size" {
  type    = number
  default = 100
}


# variable "auto_scaling" {
#   type        = bool
#   description = "This value is used activate auto scaling the k8s cluster node pools."
#   default     = false
# }

# variable "min_node_count" {
#   type        = number
#   description = "This value is used to set the minimum number of nodes for auto scaling the k8s cluster node pools."
#   default     = null
# }

#It is required to define each resource per availability zone on it's own (One definition for zone 1 and one definition for zone 2)
variable "custom_nodepools" {
  type = list(object({
    name          = string
    auto_scaling  = optional(bool, false)
    node_count = number
    nodepool_per_zone_count = optional(number, 1)
    min_node_count= optional(number, null)
    max_node_count= optional(number, null)
    ram_size      = number
    core_count    = number
    purpose       = string
    availability_zone = string
    ignore_changes = string
    availabilityzones = list(string)
    })
  )
  description = "This object describes nodepool configurations for dynamic creation of nodepools with a specific purpose and resources."
  default = list(object({
      nodepool_per_zone_count = var.nodepool_per_zone_count
      node_count = var.node_count
      ram_size = var.ram_size
      core_count = var.core_count
      purpose = "legacy"
      availability_zone = var.availability_zone
      node_count = var.node_count
      availabilityzones = ["ZONE_1", "ZONE_2"]
      allow_node_pool_replacement = var.allow_node_pool_replacement
    })
  )
}

# variable "max_node_count" {
#   type        = number
#   description = "This value is used to set the maximum number of nodes for auto scaling the k8s cluster node pools."
#   default     = null
# }