locals {
  loadbalancer_ip = concat(ionoscloud_ipblock.crip, [{ "ips" = [""] }])[0].ips[0]
  loadbalancer_dns = trim(join("", opentelekomcloud_dns_recordset_v2.dnsentry.*.name), ".")
}

