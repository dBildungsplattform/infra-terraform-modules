locals {
  # Output: returns the created ip or "" if no ip is created.
  loadbalancer_ip = concat(ionoscloud_ipblock.crip, [{ "ips" = [""] }])[0].ips[0]

  # Output: returns the dns name registered.
  loadbalancer_dns = trim(join("", opentelekomcloud_dns_recordset_v2.dnsentry.*.name), ".")

  #
  # The number of IP addresses to reserve for this block
  #
  size              = var.size

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
  ttl              =var.ttl

  #
  # top_level_domain
  #
  top_level_domain = {
    "prod"    = "de"
    "staging" = "de"
    "test"    = "de"
    "dev"     = "de"
  }

}

