
### - Outputs -----------------------------------

#
# The name of the cluster that shall be created.
#
output "cluster_name" {
  value = ionoscloud_k8s_cluster.cluster.name
}
#
# The desired Kubernetes Version
#
output "cluster_k8s_version" {
  value = ionoscloud_k8s_cluster.cluster.k8s_version
}
#
# A cluster UUID
#
output "cluster_id" {
  value = ionoscloud_k8s_cluster.cluster.id
}
