locals {

  #
  # Optional value to overwrite the default generated from the conventions.
  # Input: The dns CNAME entry.
  #
  dns_a_entry = lower("${var.domain_without_top_level}.${module.conventions_coordinates.top_level_domain}.")
  
  #
  # Output: returns the dns name registered.
  #
  service_dns = trim(join("", opentelekomcloud_dns_recordset_v2.dnsentry.*.name), ".")


}