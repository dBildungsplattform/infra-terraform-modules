# <project><-stage><-scope><-index>
output "global_identifier" {
  value = local.global_identifier
}

output "cluster_name" {
  value = local.cluster_name
}

output "datacenter_name" {
  value = local.datacenter_name
}

output "dns_zone_name" {
  value = local.dns_zone_name
}

# <project><-stage><-scope><-index>.xxxxx.<de|org|dev>
output "cluster_dns" {
  value = local.cluster_dns
}

output "top_level_domain" {
  value = local.top_level_domain
}