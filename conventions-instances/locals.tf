locals {
  #
  # The service.
  # 
  service              = var.ingress.service
  service_dot_or_empty = "${local.service}${local.service == "" ? "" : "."}"

  #
  # The instance_id.
  #
  instance_id                = var.ingress.instance_id
  instance_id_dot_or_empty   = "${local.instance_id}${local.instance_id == "" ? "" : "."}"
  instance_id_minus_or_empty = "${local.instance_id}${local.instance_id == "" ? "" : "-"}"

  #
  # The instance_location.
  #
  instance_location              = var.ingress.instance_location
  instance_location_dot_or_empty = "${local.instance_location}${local.instance_location == "" ? "" : "."}"

  
  # The stage.
  # In the url the stage is an empty string for prod. There is no ...prod.niedersachsen... */
  #

  stage_in_url       = var.stage == "prod" ? "" : var.stage
  stage_dot_or_empty = "${local.stage_in_url}${local.stage_in_url == "" ? "" : "."}"

  # ====================================================
  # = Output calculation ===============================
  # ====================================================

  #
  # [<instance_id>.]<instance_location>.<domain>
  #
  subdomain_level_1 = "${local.instance_id_dot_or_empty}${local.instance_location_dot_or_empty}${var.domain_without_top_level}.${var.top_level_domain}"

  #
  # [<stage>.][<instance_id>.]<instance_location>.<domain>
  #
  subdomain_level_2 = "${local.stage_dot_or_empty}${local.instance_id_dot_or_empty}${local.instance_location_dot_or_empty}${var.domain_without_top_level}.${var.top_level_domain}"

  #
  # CNAME service alias for the A entry.
  #
  internal_alias_dns = "${local.service_dot_or_empty}${local.stage_dot_or_empty}${local.instance_id_dot_or_empty}${local.instance_location_dot_or_empty}${var.domain_without_top_level}.${var.top_level_domain}"

  #
  # instance
  #
  instance = "${local.instance_id_minus_or_empty}${local.instance_location}"
}
