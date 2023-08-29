
### - Outputs -----------------------------------

#
# cluster_name
#
output "cluster_name" {
  value = ionoscloud_k8s_cluster.cluster.name
}

#
# cluster_k8s_version
#
output "cluster_k8s_version" {
  value = ionoscloud_k8s_cluster.cluster.k8s_version
}

#
# cluster_id
#
output "cluster_id" {
  value = ionoscloud_k8s_cluster.cluster.id
}
