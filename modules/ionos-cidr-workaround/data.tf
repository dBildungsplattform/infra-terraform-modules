data "ionoscloud_k8s_cluster" "k8s_cluster" {
  id = var.k8s_cluster_id
}

data "ionoscloud_k8s_node_pool" "k8s_node_pool" {
  id             = data.ionoscloud_k8s_cluster.k8s_cluster.node_pools[0]
  k8s_cluster_id = var.k8s_cluster_id
}

data "ionoscloud_servers" "k8s_node" {
  datacenter_id = data.ionoscloud_k8s_node_pool.k8s_node_pool.datacenter_id
  filter {
    name  = "name"
    value = data.ionoscloud_k8s_node_pool.k8s_node_pool.name
  }
}

data "ionoscloud_k8s_node_pool_nodes" "k8s_node_pools" {
  count = length(data.ionoscloud_k8s_cluster.k8s_cluster.node_pools)
  node_pool_id  = data.ionoscloud_k8s_cluster.k8s_cluster.node_pools[count.index]
  k8s_cluster_id = var.k8s_cluster_id
}

data "ionoscloud_servers" "k8s_nodes" {
  datacenter_id = data.ionoscloud_k8s_node_pool.k8s_node_pool.datacenter_id

   dynamic "filter" {
    for_each = local.node_names
     content { 
      name  = "name"
      value = "${filter.value}"
    }
  }
}