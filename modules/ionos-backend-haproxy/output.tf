output "server_primary_ip" {
  value = ionoscloud_server.server.primary_ip
}

output "cluster_lan" {
  value = local.cluster_lan
}

output "server_public_ip" {
  value = ionoscloud_server.server.primary_ip
}

output "crossconnect_haproxy_nics" {
  value = ionoscloud_nic.crossconnect_nic
}