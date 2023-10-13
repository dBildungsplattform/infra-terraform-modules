resource "ionoscloud_datacenter" "datacenter" {
  name        = var.datacenter_name
  location    = var.datacenter_location
  description = ""
}

resource "ionoscloud_private_crossconnect" "frontend_cc" {
  count = local.create_frontend_crossconnect ? 1 : 0
  name  = "${var.datacenter_name}-frontend-lan-cc"
}

resource "ionoscloud_share" "frontend_cc" {
  for_each        = toset(local.frontend_crossconnect_shared_group_ids)
  group_id        = each.key
  resource_id     = ionoscloud_private_crossconnect.frontend_cc[0].id
  edit_privilege  = false
  share_privilege = false
}

resource "ionoscloud_private_crossconnect" "service_cc" {
  count = local.create_service_crossconnect ? 1 : 0
  name  = "${var.datacenter_name}-service-lan-cc"
}

# Share is not removed when Terraform resource is destroyed! I.e. a share created by Terraform can only be removed manually.
resource "ionoscloud_share" "service_cc" {
  for_each        = toset(local.service_crossconnect_shared_group_ids)
  group_id        = each.key
  resource_id     = ionoscloud_private_crossconnect.service_cc[0].id
  edit_privilege  = false
  share_privilege = false
}

resource "ionoscloud_private_crossconnect" "backend_cc" {
  count = local.create_backend_crossconnect ? 1 : 0
  name  = "${var.datacenter_name}-backend-lan-cc"
}

resource "ionoscloud_share" "backend_cc" {
  for_each        = toset(local.backend_crossconnect_shared_group_ids)
  group_id        = each.key
  resource_id     = ionoscloud_private_crossconnect.backend_cc[0].id
  edit_privilege  = false
  share_privilege = false
}

resource "ionoscloud_lan" "frontend_lan" {
  count         = local.create_frontend_lan ? 1 : 0
  name          = "${var.datacenter_name}-frontend-lan"
  datacenter_id = ionoscloud_datacenter.datacenter.id
  public        = false
  pcc           = var.associated_frontend_crossconnect_id != "" ? var.associated_frontend_crossconnect_id : ionoscloud_private_crossconnect.frontend_cc[0].id
}

resource "ionoscloud_lan" "service_lan" {
  count         = local.create_service_lan ? 1 : 0
  name          = "${var.datacenter_name}-service-lan"
  datacenter_id = ionoscloud_datacenter.datacenter.id
  public        = false
  pcc           = var.associated_service_crossconnect_id != "" ? var.associated_service_crossconnect_id : ionoscloud_private_crossconnect.service_cc[0].id
}

resource "ionoscloud_lan" "backend_lan" {
  count         = local.create_backend_lan ? 1 : 0
  name          = "${var.datacenter_name}-backend-lan"
  datacenter_id = ionoscloud_datacenter.datacenter.id
  public        = false
  pcc           = var.associated_backend_crossconnect_id != "" ? var.associated_backend_crossconnect_id : ionoscloud_private_crossconnect.backend_cc[0].id

}

resource "ionoscloud_lan" "public_lan" {
  count         = local.create_public_lan ? 1 : 0
  name          = "${var.datacenter_name}-public-lan"
  datacenter_id = ionoscloud_datacenter.datacenter.id
  public        = true
}

resource "ionoscloud_lan" "nfs_server_lan" {
  count         = local.create_nfs_server_lan ? 1 : 0
  name          = "${var.datacenter_name}-nfs-lan"
  datacenter_id = ionoscloud_datacenter.datacenter.id
  public        = false
}

resource "ionoscloud_lan" "postgres_lan" {
  count         = local.create_postgres_lan ? 1 : 0
  name          = "${var.datacenter_name}-postgres-lan"
  datacenter_id = ionoscloud_datacenter.datacenter.id
  public        = false
}

resource "ionoscloud_lan" "alb_target_lan" {
  count         = local.create_alb_target_lan ? 1 : 0
  name          = "${var.datacenter_name}-alb-target-lan"
  datacenter_id = ionoscloud_datacenter.datacenter.id
  public        = false
}