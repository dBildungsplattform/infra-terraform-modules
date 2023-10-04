
output "datacenter_id" {
  value = ionoscloud_datacenter.datacenter.id
}

output "datacenter_name" {
  value = ionoscloud_datacenter.datacenter.name
}

output "datacenter_location" {
  value = ionoscloud_datacenter.datacenter.location
}

output "frontend_crossconnect_id" {
  value = join("", ionoscloud_private_crossconnect.frontend_cc.*.id)
}

output "frontend_lan_id" {
  value = join("", ionoscloud_lan.frontend_lan.*.id)
}

output "lan_frontend" {
  value = local.lan_frontend
}

output "backend_crossconnect_id" {
  value = join("", ionoscloud_private_crossconnect.backend_cc.*.id)
}

output "lan_backend" {
  value = local.lan_backend
}

output "service_crossconnect_id" {
  value = join("", ionoscloud_private_crossconnect.service_cc.*.id)
}

output "lan_service" {
  value = local.lan_service
}

output "nfs_server_lan_id" {
  value = join("", ionoscloud_lan.nfs_server_lan.*.id)
}

output "lan_nfs_server" {
  value = local.lan_nfs_server
}

output "postgres_lan_id" {
  value = join("", ionoscloud_lan.postgres_lan.*.id)
}

output "lan_postgres" {
  value = local.lan_postgres
}