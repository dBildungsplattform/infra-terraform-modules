locals {
  nicIndex = index(data.ionoscloud_servers.k8s_node.servers[0].nics.*.lan, tonumber(var.lan_id))
  prefix   = format("%s/24", data.ionoscloud_servers.k8s_node.servers[0].nics[local.nicIndex].ips[0])
  node_servers = data.ionoscloud_servers.k8s_nodes[*].servers[*]
  # it gets a list of all the nics that are attached to the provided servers and extracts the ips as a list of only the nics, that are conneted via the provided lan
  node_lan_ips = flatten([for server_idx, server in local.node_servers : [ for nic in flatten(server[*].nics[*]) :  nic.ips if nic.lan == tonumber(var.lan_id) ]])
}