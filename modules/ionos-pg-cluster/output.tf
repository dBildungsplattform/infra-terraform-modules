
### - outputs ---------------------------------
#
# The DNS name pointing to your cluster.
#
output "dns_name" {
  description = "The DNS name pointing to your cluster."
  value = ionoscloud_pg_cluster.pg_cluster.dns_name
}
