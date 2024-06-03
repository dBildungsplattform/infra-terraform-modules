output "dns_name" {
  description = "The DNS name pointing to your cluster."
  value       = ionoscloud_mariadb_cluster.mariadb_cluster.dns_name
}

output "cluster_lan_id" {
  value = var.cluster_lan_id
}
