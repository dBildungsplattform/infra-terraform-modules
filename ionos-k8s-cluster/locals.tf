locals {
  
  cluster_name = var.cluster_name

  # Valid choices depend on the datacenter location:
  # de/txl, de/fra: INTEL_SKYLAKE
  cpu_family = var.cpu_family

  #
  # Number of nodes per nodepool. 
  #
  # Note that one nodepool is created in each availability zone.
  # Example: With 2 zones, the actual total node count is twice as high as the number stated here.
  #
  # Default: 6
  #
  node_count = var.node_count != null ? var.node_count : 6

  #
  # Number of cpu cores per worker node.
  #
  # This cannot be changed, after the nodepool is created, because all worker nodes must be equal at any time.
  #
  # Default: 4
  #
  core_count = var.core_count != null ? var.core_count : 4

  #
  # Size of ram per node.
  # 
  # This cannot be changed, after the nodepool is created, because all worker nodes must be equal at any time.
  #
  # Default: 16384 MB
  #
  ram_size = var.ram_size != null ? var.ram_size : 16384

  # Nodepool
  # The number of nodepools per zone.
  #
  nodepool_per_zone_count = var.nodepool_per_zone_count

  # Nodepool _zone1
  public_ip_pool_zone1 = var.create_public_ip_pools ? ionoscloud_ipblock.ippools_zone1[*].ips : var.public_ip_pool_zone1

  # Nodepool_zone_2
  public_ip_pool_zone2 = var.create_public_ip_pools ? ionoscloud_ipblock.ippools_zone2[*].ips : var.public_ip_pool_zone2
  
  #
  #Conditional assignment of kube_config_path based on var.kube_config_path value
  #
  kube_config_path = var.kube_config_path == "" ? "./tmp/${terraform.workspace}.kubeconfig.yaml" : var.kube_config_path
  
  #
  # Assigns the value of the maintenance_day variable to the maintenance_day attribute.
  #
  maintenance_day  = var.maintenance_day

  #
  # Assigns the value of the maintenance_hour variable to the maintenance_hour attribute.
  #
  maintenance_hour = var.maintenance_hour

  #
  # api_subnet_allow_list 
  #
  api_subnet_allow_list = var.api_subnet_allow_list

  #
  #  storage_type variable 
  #
  storage_type           = var.storage_type

  #
  # storage_size
  #
  storage_size           = var.storage_size

  #
  # availability_zone
  #

  availability_zone = lookup({
    "ZONE_1" = "ZONE_1",
    "ZONE_2" = "ZONE_2",
  }, var.availability_zone, "ZONE_1")

  
}

