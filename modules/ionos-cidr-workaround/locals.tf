locals {
  nicIndex = index(data.ionoscloud_servers.k8s_node.servers[0].nics.*.lan, tonumber(var.lan_id))
  prefix   = format("%s/24", data.ionoscloud_servers.k8s_node.servers[0].nics[local.nicIndex].ips[0])
  node_lan_ips = flatten([for server_idx, server in data.ionoscloud_servers.k8s_nodes[*].servers[*] : [ for nic in flatten(server[*].nics[*]) :  nic.ips if nic.lan == tonumber(var.lan_id) ]])
}