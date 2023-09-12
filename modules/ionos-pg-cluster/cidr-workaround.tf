module "cidr_workaround" {
  source = "github.com/dBildungsplattform/infra-terraform-modules//modules/ionos-cidr-workaround?ref=v1.0.0"
  k8s_cluster_id = var.k8s_cluster_id
  lan_id         = var.lan_id
}
