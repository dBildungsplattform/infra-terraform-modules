locals {
  node_lan_ip = one([for nic in data.ionoscloud_servers.k8s_node.servers[0].nics : one(nic.ips) if nic.lan == tonumber(var.lan_id)])
  # assumption: cidr length is 24 bits
  prefix   = cidrsubnet(format("%s/24", local.node_lan_ip), 0, 0)
  node_servers = data.ionoscloud_servers.k8s_nodes[*].servers[*]
  # it gets a list of all the nics that are attached to the provided servers and extracts the ips as a list of only the nics, that are connected via the provided lan
  node_lan_ips = flatten([for server_idx, server in local.node_servers : [ for nic in flatten(server[*].nics[*]) : nic.ips if nic.lan == tonumber(var.lan_id) ]])
  # assumption: cidr length is 24 bits
  nodes_full_ip_range = [for x in range(10,256) : cidrhost(local.prefix, x)]
}
