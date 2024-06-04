output "dns_name" {
  description = "The DNS name pointing to your cluster."
  value       = ionoscloud_mariadb_cluster.mariadb_cluster.dns_name
}

output "private_lan_cidr" {
  value       = local.private_lan_cidr
}