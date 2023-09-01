#
# Installs an ingress controller into the cluster preconfigured for HPI Schul-Cloud purposes.
#
# Starting with two variants:
# 1. nodeport: Provides the ingress in the same manner as it is used in the classic sc-prod-legacy cluster.
# 2. sclb: Provides an ingress as loadbalancer with a public ip and dns entry.
#
# The ingress controller will get an external ip assigned. The external ip will be registered using the
# cluster_dns name, which is something like <project><-stage><-scope><-index>.hpi-schul-cloud.<de|org|dev>.
# Later on (not in this module) services can freely create additional CNAME entries to provide the service.
#
#
module "conventions" {
  source                   = "../conventions-coordinates"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = var.top_level_domain
}
#
# Books one public ip (crip).
#
resource "ionoscloud_ipblock" "crip" {
  count    = var.ingress_mode == "sclb" ? 1 : 0
  name     = "${module.conventions.global_identifier}-lb"
  location = var.datacenter_location
  size     = 1
}
#
# Delays the time on destroy, before the crip is removed.
# Otherwise: Error Messages:Error Code: 200 Message: [VDC-5-1080] IP ... is still in use.
#
resource "time_sleep" "crip_destroy_wait" {
  destroy_duration = "30s"

  depends_on = [ionoscloud_ipblock.crip]
}
#
# Registers the booked ip in DNS. 
# The DNS name is constructed from the cluster name and the domain.
#
resource "opentelekomcloud_dns_recordset_v2" "dnsentry" {
  count   = var.ingress_mode == "sclb" ? 1 : 0
  zone_id = data.opentelekomcloud_dns_zone_v2.dns_zone.id
  name    = lower("${module.conventions.cluster_dns}.")
  ttl     = 300
  type    = "A"
  records = [local.loadbalancer_ip]
  #
  # The local.loadbalancer_ip is created by ionoscloud_ipblock.crip. There is not implicit dependency.
  #
  depends_on = [
    ionoscloud_ipblock.crip
  ]
  lifecycle {
    ignore_changes = [zone_id]
  }
}
