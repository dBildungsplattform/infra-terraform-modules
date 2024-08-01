# Create a LAN ( private or public )
 resource "ionoscloud_lan" "lan" {
   datacenter_id = var.datacenter_id
   public        = var.is_public
   name          = format( "%s-%s-%x",var.name,var.is_public? "public":"private","-connection-lan")
 }

# Create a NIC for the basic VM and connect it to the LAN
resource "ionoscloud_nic" "nic" {
  datacenter_id   = var.datacenter_id
  server_id       = var.server_id
  dhcp            = var.dhcp_enabled
  lan             = ionoscloud_lan.lan.id
  firewall_active = true
}

# Add The Ports The VM
resource "ionoscloud_firewall" "rule" {
  count            = length(var.ports)
  datacenter_id    = var.datacenter_id
  server_id        = var.server_id
  nic_id           = ionoscloud_nic.nic.id
  protocol         = var.ports[count.index]["protocol"]
  name             = var.ports[count.index]["name"]
  port_range_start = var.ports[count.index]["port"]
  port_range_end   = var.ports[count.index]["port"]
  source_ip        = lookup(var.ports[count.index], "source_ip", null)
}

