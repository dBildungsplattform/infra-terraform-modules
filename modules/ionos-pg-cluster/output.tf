output "dns_name" {
  description = "The DNS name pointing to your cluster."
  value       = ionoscloud_pg_cluster_v2.pg_cluster.dns_name
}
