module "conventions" {
  source = "github.com/dBildungsplattform/infra-terraform-modules//modules/conventions-coordinates?ref=v1.0.0"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = var.top_level_domain
}

resource "ionoscloud_ipblock" "crip" {
  count    = var.ingress_mode == "sclb" ? 1 : 0
  name     = "${module.conventions.global_identifier}-lb"
  location = var.datacenter_location
  size     = 1
}

resource "time_sleep" "crip_destroy_wait" {
  destroy_duration = "30s"

  depends_on = [ionoscloud_ipblock.crip]
}

resource "opentelekomcloud_dns_recordset_v2" "dnsentry" {
  count   = var.ingress_mode == "sclb" ? 1 : 0
  zone_id = data.opentelekomcloud_dns_zone_v2.dns_zone.id
  name    = lower("${module.conventions.cluster_dns}.")
  ttl     = 300
  type    = "A"
  records = [local.loadbalancer_ip]
  # The local.loadbalancer_ip is created by ionoscloud_ipblock.crip. There is not implicit dependency.
  depends_on = [
    ionoscloud_ipblock.crip
  ]
  lifecycle {
    ignore_changes = [zone_id]
  }
}
