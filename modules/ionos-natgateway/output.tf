output "natgateway_id" {
  value = ionoscloud_natgateway.natgateway.id
}

output "public_ips" {
  value = ionoscloud_ipblock.natgateway[0].ips
}