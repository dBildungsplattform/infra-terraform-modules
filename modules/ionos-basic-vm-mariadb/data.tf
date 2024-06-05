data "ionoscloud_lan" "private_lan" {
  datacenter_id = var.datacenter_id
  id            = ionoscloud_lan.private_lan.id
}