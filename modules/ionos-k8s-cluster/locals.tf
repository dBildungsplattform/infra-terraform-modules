locals {
  cluster_name = var.cluster_name
  # Valid choices depend on the datacenter location:
  # de/txl, de/fra: INTEL_SKYLAKE
  cpu_family = var.cpu_family
  # Number of nodes per nodepool. 
  # Note that one nodepool is created in each availability zone.
  # Example: With 2 zones, the actual total node count is twice as high as the number stated here.
  node_count = var.node_count
  #node_count = var.custom_nodepools != null ? (var.min_node_count - 1) : (var.node_count != null ? var.node_count : 1) #What should the default node count be?
  # This cannot be changed, after the nodepool is created, because all worker nodes must be equal at any time.
  #core_count = var.core_count
  # This cannot be changed, after the nodepool is created, because all worker nodes must be equal at any time.
  ram_size = var.ram_size != null ? var.ram_size : 16384
  # The number of nodepools per zone.
  nodepool_per_zone_count = var.nodepool_per_zone_count
  public_ip_pools    = var.create_public_ip_pools ? ionoscloud_ipblock.ippools_scaling[*].ips : var.public_ip_pools
  #maintenance_day         = var.maintenance_day
  #maintenance_hour        = var.maintenance_hour
  api_subnet_allow_list   = var.api_subnet_allow_list

  #Loop through our nodepool list to detect empty values and fill them with legacy values
  #Only required for downward compatibility and legacy nodepools
  custom_nodepools =  [ for np in var.custom_nodepools : {
      name = np.name
      purpose = np.purpose
      auto_scaling = np.auto_scaling
      min_node_count = np.min_node_count
      max_node_count = np.max_node_count
      availability_zones = np.availability_zones
      nodepool_per_zone_count = np.nodepool_per_zone_count != null ? np.nodepool_per_zone_count : var.nodepool_per_zone_count
      node_count = np.node_count != null ? np.node_count : var.node_count
      ram_size = np.ram_size != null ? np.ram_size : var.ram_size
      core_count = np.core_count != null ? np.core_count : var.core_count
      allow_node_pool_replacement = np.allow_node_pool_replacement != null ? np.allow_node_pool_replacement : var.allow_node_pool_replacement
      associated_lans = np.associated_lans != null ? np.associated_lans : var.associated_lans
      maintenance_day = np.maintenance_day != null ? np.maintenance_day : var.maintenance_day
      maintenance_hour = np.maintenance_hour != null ? np.maintenance_hour : var.maintenance_hour
    }  
  ]


  #availabilityzone_split duplicates objects with each of their Availability zones once. if [ZONE1, ZONE2] we get 2 objects with one of those each.
  availabilityzone_split = toset(flatten([for n in local.custom_nodepools : [for x in n.availability_zones : merge(n,{availabilityzone = x})] ]))
  #nodepool_per_zone_creator this duplicates the objects in each availability zone to the amount of nodepool_per_zone_count
  nodepool_per_zone_creator = toset(flatten([for n in local.availabilityzone_split : [for x in range(n.nodepool_per_zone_count) : merge(n,{nodepool_index = x})] ]))
}

