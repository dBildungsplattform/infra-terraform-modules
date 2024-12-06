resource "ionoscloud_ipblock" "public_ip" {
  count    = var.create_ip_pool ? 1 : 0
  name     = var.ip_pool_name
  location = var.datacenter_location
  size     = 1
}

resource "ionoscloud_lan" "basic_vm_server_lan" {
  count = var.create_lan ? 1 : 0
  datacenter_id = var.datacenter
  public        = true
  name          = "${var.server_name}-vm-public"
}

resource "opentelekomcloud_dns_recordset_v2" "a_records" {
  zone_id = data.opentelekomcloud_dns_zone_v2.dns_zone.id
  name    = "${var.fulldomainname}"
  ttl     = 300
  type    = "A"
  records = [local.public_ip]
  
  lifecycle {
    ignore_changes = [zone_id]
  }
}

resource "ionoscloud_firewall" "rule" {
  count = length(var.ports)
  datacenter_id    = var.datacenter
  server_id        = local.basic_vm_server.id
  nic_id           = local.basic_vm_server.primary_nic
  protocol         = var.ports[count.index]["protocol"]
  name             = var.ports[count.index]["name"]
  port_range_start = var.ports[count.index]["port"]
  port_range_end   = var.ports[count.index]["port"]
  source_ip        = lookup(var.ports[count.index], "source_ip", null)
}

resource "ionoscloud_firewall" "range_rule" {
  count = length(var.port_ranges)
  datacenter_id    = var.datacenter
  server_id        = local.basic_vm_server.id
  nic_id           = local.basic_vm_server.primary_nic
  protocol         = var.port_ranges[count.index]["protocol"]
  name             = var.port_ranges[count.index]["name"]
  port_range_start = var.port_ranges[count.index]["port_start"]
  port_range_end   = var.port_ranges[count.index]["port_end"]
  source_ip        = lookup(var.port_ranges[count.index], "source_ip", null)
}

module "conventions_coordinates" {
  source                   = "../conventions-coordinates"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = var.top_level_domain
} 

# Extra Volume 
# /dev/vdb
resource "ionoscloud_volume" "second_volume" {
  count                   = var.basic_vm_create_second_volume ? 1 : 0
  datacenter_id           = var.datacenter
  server_id               = local.basic_vm_server.id
  name                    = "second-volume-${var.basic_vm_second_volume_disk_type}"
  size                    = var.basic_vm_second_volume_size
  disk_type               = var.basic_vm_second_volume_disk_type
  bus                     = "VIRTIO"
  licence_type            = "UNKNOWN"

  lifecycle {
  prevent_destroy = true
  }
}
