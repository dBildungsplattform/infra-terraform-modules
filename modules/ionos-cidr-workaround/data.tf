data "ionoscloud_k8s_cluster" "k8s_cluster" {
  id = var.k8s_cluster_id
}

data "ionoscloud_k8s_node_pool" "k8s_node_pool" {
  id             = data.ionoscloud_k8s_cluster.k8s_cluster.node_pools[0]
  k8s_cluster_id = var.k8s_cluster_id
}

data "ionoscloud_servers" "k8s_nodes" {
  datacenter_id = data.ionoscloud_k8s_node_pool.k8s_node_pool.datacenter_id
  filter {
    name  = "name"
    value = data.ionoscloud_k8s_node_pool.k8s_node_pool.name
  }
}