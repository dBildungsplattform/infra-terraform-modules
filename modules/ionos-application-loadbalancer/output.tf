output "alb_ip" {
  value = ionoscloud_ipblock.alb.ips[0]
}

output "loadbalancer_ip" {
  value = trim(join("", opentelekomcloud_dns_recordset_v2.dnsentry.*.name), ".")
}