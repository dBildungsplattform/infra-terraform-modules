module "cidr_workaround" {
  source         = "../../modules/ionos-cidr-workaround"
  k8s_cluster_id = var.k8s_cluster_id
  lan_id         = var.lan_id
}

locals {
  nicIndex = module.cidr_workaround.nicIndex
  node_count = var.instances_count # TODO: sharding
  prefix = module.cidr_workaround.prefix
  full_ips  = [for i in range(0, local.node_count) : cidrhost(local.prefix, var.ip_block_start + i)]
  cidrs     = [for ip in local.full_ips : format("%s/%s", ip, var.subnet_mask)]
}
