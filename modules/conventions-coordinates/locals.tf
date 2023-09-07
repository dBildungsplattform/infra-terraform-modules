locals{
### - locals ---------------------------------
# 
#The project. Examples: sc */
#
project = var.coordinates.project

# 
#The stage. Examples: 'prod', 'staging', 'dev'.
#

stage = var.coordinates.stage
minus_stage_or_empty = "${local.stage == "" ? "" : "-"}${local.stage}"
#
#The scope. Example: schulcloud 
#  
scope                = var.coordinates.scope
minus_scope_or_empty = "${local.scope == "" ? "" : "-"}${local.scope}"
#   
# An index. Gives you the option to multiply things in a specific scope.
#Example: '01', '02'. Default='' 
#
  
index                = var.coordinates.index
minus_index_or_empty = "${local.index == "" ? "" : "-"}${local.index}"

# ====================================================
# = Output calculatin ================================
# ====================================================

#
#project-stage-scope-index
#This is the most commonly used identifier for resource names in the IONOS DCD.
#

global_identifier = "${local.project}${local.minus_stage_or_empty}${local.minus_scope_or_empty}${local.minus_index_or_empty}"

cluster_name      = local.global_identifier

datacenter_name   = local.global_identifier
#
#It selects the top_level_domain value based on the current local.stage value from the var.top_level_domain map.
# 
top_level_domain   = var.top_level_domain[local.stage]

# 
#An identifier that can be used to get the dns zone as data source by name.
#https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/dns_zone_v2
#E.g. "dBildungsplattform.de"
#

dns_zone_name = "${var.domain_without_top_level}.${local.top_level_domain}."

# luster URL without protocol. Only the dns part.
#<project><-stage><-scope><-index>.dBildungsplattform.<de|org|dev>*/
#
cluster_dns = "${local.project}${local.minus_stage_or_empty}${local.minus_scope_or_empty}${local.minus_index_or_empty}.${var.domain_without_top_level}.${local.top_level_domain}"

}