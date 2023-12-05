module "conventions_coordinates" {
  source                   = "../../modules/conventions-coordinates"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = var.top_level_domain
}

resource "ionoscloud_lan" "nlb_listener_lan" {
    datacenter_id         = var.datacenter_id
    public                = true
    name                  = "${var.datacenter_name}-nlb-listener-lan"
}


resource "ionoscloud_ipblock" "nlb" {
  name     = "${module.conventions_coordinates.global_identifier}-nlb"
  location = var.datacenter_location
  size     =  1
}

resource "ionoscloud_networkloadbalancer" "nlb" {
    datacenter_id         = var.datacenter_id
    name                  = "${module.conventions_coordinates.global_identifier}-nlb"
    listener_lan          = ionoscloud_lan.nlb_listener_lan.id
    ips                   = [ionoscloud_ipblock.nlb.ips[0]]
    target_lan            = var.nlb_target_lan_id
    lb_private_ips        = [ "${local.node_ip_part}.225/24" ]

}

resource "ionoscloud_networkloadbalancer_forwardingrule" "forward_k8" {
    datacenter_id               = var.datacenter_id
    networkloadbalancer_id      = ionoscloud_networkloadbalancer.nlb.id
    name                        = "forward-k8s"
    algorithm                   = "ROUND_ROBIN"
    protocol                    = "TCP"
    listener_ip                 = ionoscloud_ipblock.nlb.ips[0]
    listener_port               = var.nlb_listener_port
    dynamic "targets" {
      for_each = var.node_nlb_lan_ips
      content { 
        ip                    = "${targets.value}"
        port                  = var.nlb_target_port
        weight                = "1"
        health_check {
             check              = true
             check_interval     = var.nlb_target_health_check_timeout
        }
    }
}
}