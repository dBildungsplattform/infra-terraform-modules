data "ionoscloud_private_crossconnect" "crossconnect" {
  for_each = var.crossconnects_nlb
  name  = each.key
}