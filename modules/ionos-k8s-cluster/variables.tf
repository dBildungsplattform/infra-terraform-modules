variable "cluster_name" {
  type        = string
  description = "Kubernetes cluster name"
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes version"
  default     = null
}

variable "cpu_family" {
  type        = string
  description = "Valid cpu family"
  default     = "INTEL_SKYLAKE"
}

variable "datacenter_id" {
  type        = string
  description = "ID of datacenter cluster shall be created in"
}

variable "datacenter_location" {
  type        = string
  description = "The location of the datacenter"
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

###### These values define the legacy Kubernetes Node Pool, not the custom node pool list #########
variable "core_count" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing"
  default = null
}

variable "ram_size" {
  type        = number
  description = "This value overwrites pre-defined environment specific k8s cluster sizing"
 default = null
}

variable "associated_lans" {
  description = "The lans as objects in a list [{lan[0] with id and routes_list, lan[1] with id and routes_list}, ...]"
  type = list(object({
    id          = number
    routes_list = list(any)
  }))
  default = []
}

variable "nodepool_per_zone_count" {
  type        = number
  description = ""
  default     = 0
}

variable "node_count" {
  type        = number
  description = "This value overwrites specific k8s cluster sizing"
  default = null
}

variable "create_public_ip_pools" {
  type    = bool
  default = false
}

variable "storage_type" {
  type    = string
  description = "The type of the Nodes volume. Can be SSD or HDD"
  default = "SSD"
}

variable "storage_size" {
  type    = number
  description = "The size of the Nodes volume"
  default = 100

}
################################################################

variable "api_subnet_allow_list" {
  type    = list(string)
  description = "Access to the K8s API Server is restricted to these CIDSs. If no allow list is specified, access is not restricted."
  default = null
}

variable "public_ip_pool_zone1" {
  type    = list(list(string))
  default = null
}

variable "public_ip_pool_zone2" {
  type    = list(list(string))
  default = null
}


variable "enable_legacy_and_scaling" {
  type = bool
  default = false
  description = "Defines whether the legacy Node Pools are used and the Custom Node Pool list. Custom Node Pool list overwrites legacy Node Pool "
}

#It is required to define each resource per availability zone on it's own (One definition for zone 1 and one definition for zone 2)
variable "custom_nodepools" {
  type = list(object({
    name          = string
    auto_scaling  = optional(bool, false)
    node_count = number
    nodepool_per_zone_count = number
    min_node_count= optional(number, null)
    max_node_count= optional(number, null)
    ram_size      = number
    core_count    = number
    purpose       = string
    availability_zones = optional(list(string), ["ZONE_1","ZONE_2"])
    allow_node_pool_replacement = bool
    associated_lans = list(object({
      id          = number
      routes_list = list(any)
    }))
    maintenance_day = string
    maintenance_hour = number
    storage_type = optional(string, "SSD")
    storage_size = optional(number, 100)
    cpu_family = optional(string, "INTEL_SKYLAKE")
    create_public_ip_pools = bool
    public_ips = optional(map(list(list(string))), {ZONE_1=[[""]], ZONE_2=[[""]]})
    })
  )
  description = "This object describes nodepool configurations for dynamic creation of nodepools with a specific purpose and resources."
  default = [{
    name = "Legacy"
    auto_scaling = false
    nodepool_per_zone_count = null
    node_count = null
    min_node_count= null
    max_node_count= null
    ram_size = null
    core_count = null
    purpose = "legacy"
    availability_zones = ["ZONE_1", "ZONE_2"]
    allow_node_pool_replacement = null
    associated_lans = null
    maintenance_day = null
    maintenance_hour = null
    storage_type = null
    storage_size = null
    cpu_family = null
    create_public_ip_pools = null
    public_ips = {ZONE_1=[[""]], ZONE_2=[[""]]}
  }]
}