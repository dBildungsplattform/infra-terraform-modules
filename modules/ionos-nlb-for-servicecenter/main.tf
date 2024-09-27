module "conventions_coordinates" {
  source                   = "../../modules/conventions-coordinates"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = var.top_level_domain
}

resource "ionoscloud_lan" "crossconnect_lan" {
  count         = length(var.crossconnects)
  datacenter_id = var.datacenter_id
  name          = "${data.ionoscloud_private_crossconnect.crossconnect[count.index].name}-lan"
  public        = false
  pcc           = data.ionoscloud_private_crossconnect.crossconnect[count.index].id
  depends_on = [
    data.ionoscloud_private_crossconnect.crossconnect
  ]
}

resource "ionoscloud_networkloadbalancer" "nlb" {
  count         = length(var.crossconnects)
  datacenter_id = var.datacenter_id
  name          = "${module.conventions_coordinates.global_identifier}-nlb-${count.index}"
  listener_lan  = ionoscloud_lan.crossconnect_lan[count.index].id
  ips           = [var.listener_ips[count.index]]
  target_lan    = var.nlb_target_lan_id
}

resource "ionoscloud_networkloadbalancer_forwardingrule" "forward_k8" {
  count                  = length(var.crossconnects)
  datacenter_id          = var.datacenter_id
  networkloadbalancer_id = ionoscloud_networkloadbalancer.nlb[count.index].id
  name                   = "forward-logs-and-metrics"
  algorithm              = "ROUND_ROBIN"
  protocol               = "TCP"
  listener_ip            = var.listener_ips[count.index]
  listener_port          = var.nlb_listener_port
  dynamic "targets" {
    for_each = var.node_nlb_lan_ips
    content {
      ip     = targets.value
      port   = var.nlb_target_port
      weight = "1"
      health_check {
        check          = true
        check_interval = var.nlb_target_health_check_timeout
      }
    }
  }
}