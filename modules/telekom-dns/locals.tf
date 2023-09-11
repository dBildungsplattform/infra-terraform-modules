locals {
  dns_a_entry = var.dns_a_entry == "" ? module.conventions_coordinates.cluster_dns : var.dns_a_entry 
  service_dns = trim(join("", opentelekomcloud_dns_recordset_v2.dnsentry.*.name), ".")
}