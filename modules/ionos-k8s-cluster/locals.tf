locals {
  cluster_name = var.cluster_name
  # Valid choices depend on the datacenter location:
  # de/txl, de/fra: INTEL_SKYLAKE
  cpu_family = var.cpu_family

  api_subnet_allow_list   = var.api_subnet_allow_list

  # Create legacy object for possible merging into the nodepool list(Only used when both legacy and custom nodespools are in use)
  legacy_object = tolist([{
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
    associated_lans = var.associated_lans
    maintenance_day = null
    maintenance_hour = null
    storage_type = null
    storage_size = null
    cpu_family = null
    create_public_ip_pools = null
    public_ips = {ZONE_1=[[]], ZONE_2=[[]]}
  }])

  cleaned_availability_zone = tr(var.availability_zone, "_", "")
  # check if both legacy and scaling should be used, if so merge legacy object into the object list if needed (default = false)
  # if false: No need to do anything because it is either legacy or scaling
  # if true: check if first object is legacy, if not only scaling objects are in the list => merge legacy into it
  legacy_check = var.enable_legacy_and_scaling == false ? var.custom_nodepools : (var.custom_nodepools[0].purpose != "legacy" ? tolist(concat(var.custom_nodepools, local.legacy_object)) : var.custom_nodepools)

  # availability_zone_split duplicates objects with each of their Availability zones once. if [ZONE1, ZONE2] we get 2 objects with one of those zones each.
  availability_zone_split = toset(flatten([for n in local.legacy_check : [for x in n.availability_zones : merge(n,{availability_zone = x})] ]))

  # Loop through our nodepool list to detect empty values and fill them with legacy values
  # Only required for downward compatibility and legacy nodepools (If no downward compatibility is required just use var.custom_nodepools to loop over)
  custom_nodepools =  [ for np in local.availability_zone_split : {
      name = np.name
      purpose = np.purpose
      auto_scaling = np.auto_scaling
      min_node_count = np.min_node_count
      max_node_count = np.max_node_count
      availability_zone = np.availability_zone
      nodepool_per_zone_count = np.nodepool_per_zone_count != null ? np.nodepool_per_zone_count : var.nodepool_per_zone_count
      node_count = np.node_count != null ? np.node_count : var.node_count
      ram_size = np.ram_size != null ? np.ram_size : var.ram_size
      core_count = np.core_count != null ? np.core_count : var.core_count
      allow_node_pool_replacement = np.allow_node_pool_replacement != null ? np.allow_node_pool_replacement : var.allow_node_pool_replacement
      associated_lans = np.associated_lans != null ? np.associated_lans : var.associated_lans
      maintenance_day = np.maintenance_day != null ? np.maintenance_day : var.maintenance_day
      maintenance_hour = np.maintenance_hour != null ? np.maintenance_hour : var.maintenance_hour
      storage_type = np.storage_type != null ? np.storage_type : var.storage_type
      storage_size = np.storage_size != null ? np.storage_size : var.storage_size
      cpu_family = np.cpu_family != null ? np.cpu_family : var.cpu_family
      create_public_ip_pools = np.create_public_ip_pools != null ? np.create_public_ip_pools : var.create_public_ip_pools
      public_ips = np.create_public_ip_pools == true ? [[]] : np.purpose == "legacy" ? (np.availability_zone == "ZONE_1" ? var.public_ip_pool_zone1 : var.public_ip_pool_zone2) : np.public_ips[np.availability_zone]
    }  
  ]

  # nodepool_per_zone_creator this duplicates the objects in each availability zone to the amount of nodepool_per_zone_count
  nodepool_per_zone_creator = toset(flatten([for n in local.custom_nodepools : [for x in range(0, n.nodepool_per_zone_count) : merge(n,{nodepool_index = x})] ]))
}
