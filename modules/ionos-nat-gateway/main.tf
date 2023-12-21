resource "ionoscloud_natgateway" "natgateway" {
  datacenter_id           = var.datacenter_id
  name                    = var.natgateway_name
  public_ips              = var.natgateway_public_ips
   lans {
     id                = var.lan_id
     gateway_ips       = [ local.gateway_ip ]
   }
}

resource "ionoscloud_natgateway_rule" "natgateway_rule" {
  datacenter_id           = var.datacenter_id
  natgateway_id           = ionoscloud_natgateway.gateway.id
  name                    = var.natgateway_rule_name
  type                    = "SNAT"
  protocol                = "TCP"
  source_subnet           = local.gateway_subnet
  public_ip               = var.natgateway_public_ips[0]
}