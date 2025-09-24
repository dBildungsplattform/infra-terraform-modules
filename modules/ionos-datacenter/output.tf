
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

output "alb_target_lan_id" {
  value = join("", ionoscloud_lan.alb_target_lan.*.id)
}

output "lan_alb_target" {
  value = local.lan_alb_target
}

output "nlb_target_lan_id" {
  value = join("", ionoscloud_lan.nlb_target_lan.*.id)
}

output "lan_nlb_target" {
  value = local.lan_nlb_target
}

output "nat_lan_id" {
  value = join("", ionoscloud_lan.nat_lan.*.id)
}

output "lan_nat" {
  value = local.lan_nat
}

output "custom_lans_id" {
  value = { for name, lan in ionoscloud_lan.custom_lan: name => lan.id }
}

output "lans_custom" {
  value = local.lans_custom
}

output "kafka_lan" {
  value = local.lan_kafka
}

output "kafka_lan_cidr" {
  value       = var.create_kafka_lan ? ionoscloud_lan.kafka_lan[0].ipv4_cidr_block : null
}

output "kafka_test_lan_cidr" {
  value = contains(keys(ionoscloud_lan.custom_lan), "kafka_test") ? ionoscloud_lan.custom_lan["kafka_test"].ipv4_cidr_block : null
}