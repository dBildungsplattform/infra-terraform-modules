output "lan_id" {
  description = "The id of the lan created"
  value = ionoscloud_lan.lan.id
}

output "nic_id" {
  description = "The id of the nic created"
  value = ionoscloud_nic.nic.id
}
