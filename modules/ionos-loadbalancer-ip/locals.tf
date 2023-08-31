
### - locals -----------------------------------

locals {
  #
  # Output: returns the created ip or "" if no ip is created.
  #
  loadbalancer_ip = concat(ionoscloud_ipblock.crip, [{ "ips" = [""] }])[0].ips[0]
  #
  # Output: returns the dns name registered.
  #
  loadbalancer_dns = trim(join("", opentelekomcloud_dns_recordset_v2.dnsentry.*.name), ".")
}

