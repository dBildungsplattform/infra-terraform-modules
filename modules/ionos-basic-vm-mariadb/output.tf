# output "dns_name" {
#   description = "The DNS name pointing to your cluster."
#   value       = ionoscloud_mariadb_cluster.mariadb_cluster.dns_name
# }

output "private_lan_cidr" {
  description = "The CIDR range of the private LAN created for the basic VM and MariaDB cluster"
  value       = local.private_lan_cidr
}

output "private_lan_id" {
  description = "The ID of the private LAN created for the basic VM and MariaDB cluster"
  value       = ionoscloud_lan.private_lan.id
}
output "basic_vm_server_id" {
  description = "The ID of the basic VM server"
  value       = module.basic-vm.basic_vm_server_id
}
output "basic_vm_nic_id" {
  description = "The ID of the NIC attached to the basic VM"
  value       = ionoscloud_nic.basic_vm_nic.id
}

output "mariadb_cluster_lan_cidr" {
  description = "The CIDR range of the LAN for the MariaDB cluster"
  value       = local.mariadb_cluster_lan_cidr
}