output "nicIndex" {
  value = local.nicIndex
  description = "Index of the NIC used by the provided LAN in the Kubernetes nodes."
}

output "prefix" {
  value = local.prefix
  description = "CIDR block used by the Kubernetes cluster, for example '10.0.0.0/24'."
}

output "node_lan_ips" {
  value = local.node_lan_ips
  description = "List of the IPs assigned to the currently deployed Kubernetes nodes. When using this keep in mind that some of the IPs will change during maintenance."
}

output "nodes_full_ip_range" {
  value = local.nodes_full_ip_range
  description = "List of all the IPs in the range used by the Kubernetes cluster (IPs 10 to 255 in the prefix CIDR block)."
}
