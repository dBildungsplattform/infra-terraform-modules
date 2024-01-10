resource "ionoscloud_natgateway" "natgateway" {
  datacenter_id           = var.datacenter_id
  name                    = var.natgateway_name
  public_ips              = var.create_ipblock ? ionoscloud_ipblock.natgateway[0].ips : var.natgateway_public_ips
   lans {
     id                = var.lan_id
     gateway_ips       = [ local.gateway_ip ]
   }
}

resource "ionoscloud_natgateway_rule" "natgateway_rule" {
  datacenter_id           = var.datacenter_id
  natgateway_id           = ionoscloud_natgateway.natgateway.id
  name                    = var.natgateway_rule_name
  type                    = "SNAT"
  protocol                = var.natgateway_rule_protocol
  source_subnet           = local.gateway_subnet
  public_ip               = var.create_ipblock ? ionoscloud_ipblock.natgateway[0].ips[0] : var.natgateway_public_ips[0]
}

resource "ionoscloud_ipblock" "natgateway" {
  count                   = var.create_ipblock ? 1 : 0
  location                = var.datacenter_location
  size                    = var.ipblock_size
  name                    = var.ipblock_name
  lifecycle {
    prevent_destroy = true
  }
}
