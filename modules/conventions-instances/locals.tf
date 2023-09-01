locals {
  
  ### - locals ---------------------------------

  stage_in_url       = var.stage == "prod" ? "" : var.stage
  stage_dot_or_empty = "${local.stage_in_url}${local.stage_in_url == "" ? "" : "."}"

 
}
