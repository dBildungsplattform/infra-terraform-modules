module "conventions_coordinates" {
  source                   = "../conventions-coordinates"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = local.top_level_domain

}

module "conventions_instances" {
  source                   = "../conventions-instances"
  ingress                  = var.ingress
  stage                    = var.coordinates.stage
  top_level_domain         = module.conventions_coordinates.top_level_domain
  domain_without_top_level = var.domain_without_top_level
}

#
# Registers the given external_ip for the service in DNS. 
# The DNS name is constructed from the cluster name and the domain.
#
resource "opentelekomcloud_dns_recordset_v2" "dnsentry" {
  count   = 1
  zone_id = data.opentelekomcloud_dns_zone_v2.dns_zone.id
  name    = lower("${local.dns_a_entry}.")
  ttl     = local.ttl
  type    = local.type
  records = ["${module.conventions_coordinates.cluster_dns}."]
  
  lifecycle {
    ignore_changes = [zone_id]
  }
}

#
# Registers the given external_ip for the service in DNS. 
# The DNS name is constructed from the cluster name and the domain.
#
resource "opentelekomcloud_dns_recordset_v2" "dnsaliases" {
  count   = length(var.dns_aliases)
  zone_id = data.opentelekomcloud_dns_zone_v2.dns_zone.id
  name    = lower(var.dns_aliases[count.index])
  ttl     = local.ttl
  type    = local.type
  records = ["${module.conventions_coordinates.cluster_dns}."]
  
  lifecycle {
    ignore_changes = [zone_id]
  }
}

#
# If the registered dns CNAME has changed, wait for a while to ensure that is widely available.
# The goal of this delay is that certificate validations with HTTP01 that will usually happen afterwards, will be an instant success.
# If this waiting time is not long enough the certificate challenges will be in state pending for a longer time.
#
resource "time_sleep" "dnswait" {
  create_duration = local.destroy_duration

  depends_on = [opentelekomcloud_dns_recordset_v2.dnsentry]
}
