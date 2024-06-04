output "dns_name" {
  description = "The DNS name pointing to your cluster."
  value       = ionoscloud_mariadb_cluster.mariadb_cluster.dns_name
}

output "private_lan_cidr" {
  description = "The CIDR range of the private LAN created for the basic VM and MariaDB cluster"
  value       = local.private_lan_cidr
}

output "private_lan_id" {
  description = "The ID of the private LAN created for the basic VM and MariaDB cluster"
  value       = ionoscloud_lan.private_lan.id
}