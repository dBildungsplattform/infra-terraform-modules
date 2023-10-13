locals {
  nicIndex = index(data.ionoscloud_servers.k8s_node.servers[0].nics.*.lan, tonumber(var.lan_id))
  prefix   = format("%s/24", data.ionoscloud_servers.k8s_node.servers[0].nics[local.nicIndex].ips[0])
  node_lan_ips = flatten(data.ionoscloud_servers.k8s_nodes[*].servers[*].nics[local.nicIndex].ips[0])
  node_names = flatten(data.ionoscloud_k8s_node_pool_nodes.k8s_node_pools[*].nodes[*].name)
}