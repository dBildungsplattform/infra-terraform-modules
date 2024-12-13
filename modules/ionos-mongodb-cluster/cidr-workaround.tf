module "cidr_workaround" {
  count          = var.k8s_cluster_cidr_workaround != null ? (var.k8s_cluster_cidr_workaround ? 1 : 0) : (var.k8s_cluster_id == null ? 0 : 1)
  source         = "../../modules/ionos-cidr-workaround"
  k8s_cluster_id = var.k8s_cluster_id
  lan_id         = var.lan_id
}

locals {
  prefix    = var.ip_prefix == null ? module.cidr_workaround[0].prefix : var.ip_prefix
  full_ips  = [for i in range(0, var.instances_count) : cidrhost(local.prefix, var.ip_block_start + i)]
  cidrs     = [for ip in local.full_ips : format("%s/%s", ip, var.subnet_mask)]
}