output "cluster_name" {
  value = ionoscloud_k8s_cluster.cluster.name
}
output "cluster_k8s_version" {
  value = ionoscloud_k8s_cluster.cluster.k8s_version
}
output "cluster_id" {
  value = ionoscloud_k8s_cluster.cluster.id
}
output "nodepool_zone1_id" {
  value = values(ionoscloud_k8s_node_pool.nodepool_legacy)[*].id
}
# output "nodepool_zone2_id" {
#   value = ionoscloud_k8s_node_pool.nodepool_zone2[*].id
# }
# output "nodepool_zone1_ips" {
#   value = concat(ionoscloud_ipblock.ippools_zone1[*].ips)
# }
# output "nodepool_zone2_ips" {
#   value = concat(ionoscloud_ipblock.ippools_zone2[*].ips)
# }