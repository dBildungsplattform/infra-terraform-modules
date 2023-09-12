locals {
  project              = var.coordinates.project
  stage                = var.coordinates.stage
  minus_stage_or_empty = "${local.stage == "" ? "" : "-"}${local.stage}"
  scope                = var.coordinates.scope
  minus_scope_or_empty = "${local.scope == "" ? "" : "-"}${local.scope}"
  index                = var.coordinates.index
  minus_index_or_empty = "${local.index == "" ? "" : "-"}${local.index}"

  # Output calculatin
  global_identifier = "${local.project}${local.minus_stage_or_empty}${local.minus_scope_or_empty}${local.minus_index_or_empty}"
  cluster_name      = local.global_identifier
  datacenter_name   = local.global_identifier
  top_level_domain  = var.top_level_domain[local.stage]
  dns_zone_name     = "${var.domain_without_top_level}.${local.top_level_domain}."
  cluster_dns       = "${local.project}${local.minus_stage_or_empty}${local.minus_scope_or_empty}${local.minus_index_or_empty}.${var.domain_without_top_level}.${local.top_level_domain}"
}