data "ionoscloud_private_crossconnect" "crossconnect" {
  count = length(var.crossconnects)
  name  = var.crossconnects[count.index]
}
