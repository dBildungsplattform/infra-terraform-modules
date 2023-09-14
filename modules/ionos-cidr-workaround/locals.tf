locals {
  nicIndex = index(data.ionoscloud_servers.k8s_nodes.servers[0].nics.*.lan, tonumber(var.lan_id))
  prefix   = format("%s/24", data.ionoscloud_servers.k8s_nodes.servers[0].nics[local.nicIndex].ips[0])
}