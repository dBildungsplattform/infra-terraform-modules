module "cidr_workaround" {
  source         = "../../modules/ionos-cidr-workaround"
  k8s_cluster_id = var.k8s_cluster_id
  lan_id         = var.lan_id
}

locals {
  prefix = module.cidr_workaround.prefix
  gateway_ip = "${cidrhost(local.prefix, var.natgateway_host_num)}"
  gateway_subnet = "${cidrhost(local.prefix, 0)}/24"
}