
### - outputs ---------------------------------
#
#This is the most commonly used identifier for resource names in the IONOS DCD.
#<project><-stage><-scope><-index>
#Example: sc-prod-schulcloud */
#
output "global_identifier" {
value = local.global_identifier
}
# 
#The name of the Kubernetes cluster in the IONOS DCD.
#Identical to the global_identifier.
#
output "cluster_name" {
  value = local.cluster_name
}
#
#The name of the datacenter in the IONOS DCD.
#Identical to the global_identifier.
#
output "datacenter_name" {
  value = local.datacenter_name
}
#
#An identifier that can be used to get the dns zone as data source by name.
#E.g. ".de" 
#

output "dns_zone_name" {
  value = local.dns_zone_name
}
#Cluster URL without protocol. Only the dns part.
#<project><-stage><-scope><-index>.dBildungsplattform.<de|org|dev>
#E.g. "sc-prod-schulcloud.dBildungsplattform.de"
#
output "cluster_dns" {
  value = local.cluster_dns
}
#
#The top level domain calculated from the selected terraform workspace.
#
output "top_level_domain" {
  value = local.top_level_domain
}
