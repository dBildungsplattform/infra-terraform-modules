#
# Import the necessary dns zone.
#
data "opentelekomcloud_dns_zone_v2" "dns_zone" {
  name = module.conventions_coordinates.dns_zone_name
}