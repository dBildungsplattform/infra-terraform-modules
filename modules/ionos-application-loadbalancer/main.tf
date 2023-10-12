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
    name                  = "ALB Kubernetes"
    listener_lan          = ionoscloud_lan.alb_listener_lan.id
    ips                   = [ionoscloud_ipblock.alb.ips[0]]
    target_lan            = var.alb_target_lan_id
    lb_private_ips        = [ "${local.node_ip_part}.225/24" ]

}

resource "ionoscloud_application_loadbalancer_forwardingrule" "forwoard_k8s" {
    datacenter_id               = var.datacenter_id
    application_loadbalancer_id = ionoscloud_application_loadbalancer.alb.id
    name                        = "ALB FR"
    protocol                    = "HTTP"
    listener_ip                 = ionoscloud_ipblock.alb.ips[0]
    listener_port               = 443
    client_timeout              = 1000
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
    name                      = "TG K8s Node Pools" 
    algorithm                 = "ROUND_ROBIN"
    protocol                  = "HTTP"  
    dynamic "targets" {
      for_each = var.node_alb_lan_ips
      content { 
        ip                    = "${targets.value}"
        port                  = "30080"
        weight                = "1"
        health_check_enabled  = false
        maintenance_enabled   = false
      }
      }
    health_check {
        check_timeout         = 5000
        check_interval        = 50000
        retries               = 2
    }
    http_health_check {
        path                  = "/"
        method                = "GET"
        match_type            = "STATUS_CODE"
        response              = "200"
    }
}

resource "opentelekomcloud_dns_recordset_v2" "dnsentry" {
  count   = 1
  zone_id = data.opentelekomcloud_dns_zone_v2.dns_zone.id
  name    = lower("${var.dns_record_name}.")
  ttl     = 300
  type    = "A"
  records = [ionoscloud_ipblock.alb.ips[0]]
  depends_on = [
    ionoscloud_ipblock.alb
  ]
  lifecycle {
    ignore_changes = [zone_id]
  }
}

resource "opentelekomcloud_dns_recordset_v2" "wildcardentry" {
  count   = 1
  zone_id = data.opentelekomcloud_dns_zone_v2.dns_zone.id
  name    = lower("*.${var.dns_record_name}")
  ttl     = 300
  type    = "CNAME"
  records = ["${module.conventions_coordinates.cluster_dns}."]

  lifecycle {
    ignore_changes = [zone_id]
  }
}

