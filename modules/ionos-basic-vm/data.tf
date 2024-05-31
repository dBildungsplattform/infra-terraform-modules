data "opentelekomcloud_dns_zone_v2" "dns_zone" {
  name = local.dns_zone_name
}

data "ionoscloud_datacenter" "datacenter" {
  id = var.datacenter
}