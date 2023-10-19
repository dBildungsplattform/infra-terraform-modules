module "conventions_coordinates" {
  source                   = "../../modules/conventions-coordinates"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = var.top_level_domain
}

resource "ionoscloud_lan" "alb_listener_lan" {
    datacenter_id         = var.datacenter_id
    public                = true
    name                  = "${var.datacenter_name}-alb-listener-lan"
}

resource "ionoscloud_ipblock" "alb" {
  name     = "${module.conventions_coordinates.global_identifier}-alb"
  location = var.datacenter_location
  size     =  1
}

resource "ionoscloud_application_loadbalancer" "alb" {
    datacenter_id         = var.datacenter_id
    name                  = "${module.conventions_coordinates.global_identifier}-alb"
    listener_lan          = ionoscloud_lan.alb_listener_lan.id
    ips                   = [ionoscloud_ipblock.alb.ips[0]]
    target_lan            = var.alb_target_lan_id
    lb_private_ips        = [ "${local.node_ip_part}.225/24" ]

}

resource "ionoscloud_application_loadbalancer_forwardingrule" "forward_k8s" {
    datacenter_id               = var.datacenter_id
    application_loadbalancer_id = ionoscloud_application_loadbalancer.alb.id
    name                        = "forward-k8s"
    protocol                    = "HTTP"
    listener_ip                 = ionoscloud_ipblock.alb.ips[0]
    listener_port               = var.alb_listener_port
    client_timeout              = var.alb_client_timeout
    http_rules {
        name                    = "FORWARD_K8S"
        type                    = "FORWARD"
        target_group            = ionoscloud_target_group.k8s_node_pools.id
    }
    # currently this needs to get created in advance. Grep id:
    # curl GET -u $IONOS_USERNAME:$IONOS_PASSWORD https://api.ionos.com/certificatemanager/certificates | jq -r '.items[] | "\(.id) \(.properties.name)"'
    server_certificates = var.ssl_cert_ids
}


resource "ionoscloud_target_group" "k8s_node_pools" {
    name                      = "${module.conventions_coordinates.global_identifier}-k8s" 
    algorithm                 = "ROUND_ROBIN"
    protocol                  = "HTTP"  
    dynamic "targets" {
      for_each = var.node_alb_lan_ips
      content { 
        ip                    = "${targets.value}"
        port                  = var.alb_target_port
        weight                = "1"
        health_check_enabled  = true
        maintenance_enabled   = false
      }
      }
    health_check {
        check_timeout         = var.alb_target_health_check_timeout
        check_interval        = var.alb_target_health_check_timeout
        retries               = 2
    }
    http_health_check {
        path                  = var.alb_target_http_health_check_path
        method                = "HEAD"
        match_type            = "STATUS_CODE"
        response              = "200"
    }
}