locals {
  cluster_name = var.cluster_name
  cpu_family = var.cpu_family
  node_count = var.node_count
  core_count = var.core_count
  ram_size = var.ram_size
  nodepool_per_zone_count = var.nodepool_per_zone_count
  public_ip_pool_zone1 = var.create_public_ip_pools ? ionoscloud_ipblock.ippools_zone1[*].ips : var.public_ip_pool_zone1
  public_ip_pool_zone2 = var.create_public_ip_pools ? ionoscloud_ipblock.ippools_zone2[*].ips : var.public_ip_pool_zone2
  maintenance_day  = var.maintenance_day
  maintenance_hour = var.maintenance_hour
  api_subnet_allow_list = var.api_subnet_allow_list
  storage_type           = var.storage_type
  storage_size           = var.storage_size
  availability_zone = lookup({
    "ZONE_1" = "ZONE_1",
    "ZONE_2" = "ZONE_2",
  }, var.availability_zone, "ZONE_1")
}

