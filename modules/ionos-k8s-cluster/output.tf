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
  value = concat(values(ionoscloud_k8s_node_pool.nodepool_legacy)[*].id, values(ionoscloud_k8s_node_pool.nodepool_scaling)[*].id)
}
output "nodepool_zone1_ips" {
  value = concat(ionoscloud_ipblock.ippools[*].ips)
}
