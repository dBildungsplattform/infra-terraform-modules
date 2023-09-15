data "opentelekomcloud_dns_zone_v2" "dns_zone" {
  name = module.conventions.dns_zone_name
}

data "ionoscloud_private_crossconnect" "crossconnect" {
  count = length(var.crossconnects)
  name  = var.crossconnects[count.index]
}
