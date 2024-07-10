output "connection_string" {
  description = "The URL pointing to your cluster."
  value       = ionoscloud_mongo_cluster.mongo_cluster.connection_string
}
