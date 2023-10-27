locals {
  cluster_name = var.cluster_name
  # Valid choices depend on the datacenter location:
  # de/txl, de/fra: INTEL_SKYLAKE
  cpu_family = var.cpu_family
  # Number of nodes per nodepool. 
  # Note that one nodepool is created in each availability zone.
  # Example: With 2 zones, the actual total node count is twice as high as the number stated here.
  #node_count = var.node_count
  node_count = var.auto_scaling ? (var.min_node_count - 1) : (var.node_count != null ? var.node_count : 1) #What should the default node count be?
  # This cannot be changed, after the nodepool is created, because all worker nodes must be equal at any time.
  core_count = var.core_count
  # This cannot be changed, after the nodepool is created, because all worker nodes must be equal at any time.
  ram_size = var.ram_size != null ? var.ram_size : 16384
  # The number of nodepools per zone.
  nodepool_per_zone_count = var.nodepool_per_zone_count
  public_ip_pool_zone1    = var.create_public_ip_pools ? ionoscloud_ipblock.ippools_zone1[*].ips : var.public_ip_pool_zone1
  public_ip_pool_zone2    = var.create_public_ip_pools ? ionoscloud_ipblock.ippools_zone2[*].ips : var.public_ip_pool_zone2
  maintenance_day         = var.maintenance_day
  maintenance_hour        = var.maintenance_hour
  api_subnet_allow_list   = var.api_subnet_allow_list
}

