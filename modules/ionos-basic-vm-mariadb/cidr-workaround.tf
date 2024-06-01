
module "cidr_workaround" {
  source          = "../../modules/ionos-cidr-workaround"
  k8s_cluster_id  = var.k8s_cluster_id
  lan_id          = var.lan_id
  server_name     = var.server_name
}

locals {
 nicIndex         = module.cidr_workaround.nicIndex_vm
 prefix           = module.cidr_workaround.prefix
 database_ip      = cidrhost(local.prefix, 1)
 database_ip_cidr = format("%s/%s", local.database_ip, "24")
}

