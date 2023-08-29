locals {
  #
  # top_level_domain
  #
  top_level_domain = {
    "prod"    = "de"
    "staging" = "de"
    "test"    = "de"
    "dev"     = "de"
  }
  #
  # Optional value to overwrite the default generated from the conventions.
  # Input: The dns CNAME entry.
  #
  dns_a_entry = var.dns_a_entry == "" ? module.conventions_instances.internal_alias_dns : var.dns_a_entry
  #
  # Output: returns the dns name registered.
  #
  service_dns = trim(join("", opentelekomcloud_dns_recordset_v2.dnsentry.*.name), ".")

  #
  # to delay resource destroy
  #
  destroy_duration  = var.destroy_duration

  #
  # The type of record set
  # 
  type              = var.type

  #
  # The time to live (TTL) of the record set.
  #
  ttl              = var.ttl


}
