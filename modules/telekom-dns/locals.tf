locals {

  #
  # Optional value to overwrite the default generated from the conventions.
  # Input: The dns CNAME entry.
  #
  
  dns_a_entry = var.dns_a_entry == "" ? module.conventions_coordinates.cluster_dns : var.dns_a_entry # should be tested
  
  #
  # Output: returns the dns name registered.
  #
  service_dns = trim(join("", opentelekomcloud_dns_recordset_v2.dnsentry.*.name), ".")


}