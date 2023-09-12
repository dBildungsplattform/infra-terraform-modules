module "cidr_workaround" {
  # github module
  source         = "../ionos-cidr-workaround"
  k8s_cluster_id = var.k8s_cluster_id
  lan_id         = var.lan_id
}
