data "opentelekomcloud_dns_zone_v2" "dns_zone" {
  count = var.dns_zone_id == "" ? 1 : 0
  name  = module.conventions_coordinates.dns_zone_name
}

locals {
  zone_id = var.dns_zone_id != "" ? var.dns_zone_id : data.opentelekomcloud_dns_zone_v2.dns_zone[0].id
}