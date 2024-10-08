output "cluster_node_ip_range" {
  value = local.cluster_node_ip_range
}

output "service_cluster_node_ips" {
  value = var.node_nlb_lan_ips
}
