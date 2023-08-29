locals{
  
/* The project. Examples: 'dbp', 'playground'. */

project = var.coordinates.project
  
/* The stage. Examples: 'prod', 'staging', 'dev'. */
  
stage = var.coordinates.stage
minus_stage_or_empty = "${local.stage == "" ? "" : "-"}${local.stage}"

/* The scope. Example: 'legacy', 'thr', 'username'. */
  
scope                = var.coordinates.scope
minus_scope_or_empty = "${local.scope == "" ? "" : "-"}${local.scope}"
    
/* An index. Gives you the option to multiply things in a specific scope. E.g. playground-developer_name-1, playground-developer_name-2
Example: '01', '02'. Default='' */
  
index                = var.coordinates.index
minus_index_or_empty = "${local.index == "" ? "" : "-"}${local.index}"

# ====================================================
# = Output calculatin ================================
# ====================================================

/* 
project-stage-scope-index
This is the most commonly used identifier for resource names in the IONOS DCD.
*/

global_identifier = "${local.project}${local.minus_stage_or_empty}${local.minus_scope_or_empty}${local.minus_index_or_empty}"

cluster_name      = local.global_identifier

datacenter_name   = local.global_identifier

/*  Lookup top-level domain based on stage.
Map assigns top-level domains to stages.
Use local.stage as key, default to "de" if no match. */
  

top_level_domain   = lookup(var.top_level_domain, local.stage, "de")

/* 
An identifier that can be used to get the dns zone as data source by name.
https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/dns_zone_v2
E.g. "dBildungsplattform.de"
*/

dns_zone_name = "${var.domain_without_top_level}.${local.top_level_domain}."

/* luster URL without protocol. Only the dns part.
<project><-stage><-scope><-index>.hpi-schul-cloud.<de|org|dev>
E.g. "dbp-prod-legacy.dBildungsplattform.de", "playground-dev-marbarte-1.hpi-schul-cloud.dev" */

cluster_dns = "${local.project}${local.minus_stage_or_empty}${local.minus_scope_or_empty}${local.minus_index_or_empty}.${var.domain_without_top_level}.${local.top_level_domain}"



}