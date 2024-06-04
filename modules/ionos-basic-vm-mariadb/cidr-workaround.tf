module "cidr_workaround" {
  source         = "../../modules/ionos-cidr-workaround"
  k8s_cluster_id = var.k8s_cluster_id
  lan_id         = var.lan_id
}

locals {
  nicIndex                   = module.cidr_workaround.privacyidea_nicIndex
  prefix                     = module.cidr_workaround.privacyidea_prefix
  full_ip                    = cidrhost(local.prefix, var.ip_block)
  cidr                       = format("%s/%s", local.full_ip, var.subnet_mask)
  privacyidea_cluster_lan_ip = cidrhost(local.prefix, 9)
}
