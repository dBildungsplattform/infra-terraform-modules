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
# all servers in the datacenter that include the name "nodepool" are extracted 
# if servers/node_pools with a different naming convention should be in or excluded this value needs to get adjusted 
data "ionoscloud_servers" "k8s_nodes" {
  datacenter_id = data.ionoscloud_k8s_node_pool.k8s_node_pool.datacenter_id

  filter {
    name = "name"
    value = "nodepool"
  }
}

# Fetches all servers in the specified datacenter that match the server_name provided via the 'server_name' variable.
data "ionoscloud_servers" "basic-vm-mariadb" {
  datacenter_id = data.ionoscloud_k8s_node_pool.k8s_node_pool.datacenter_id
  filter {
    name  = "name"
    value = "privacyidea"
  }
}
