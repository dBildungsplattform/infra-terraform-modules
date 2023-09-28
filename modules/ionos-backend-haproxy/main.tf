module "conventions" {
  source                   = "./conventions-coordinates"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = var.top_level_domain
}

resource "ionoscloud_server" "server" {
  name              = "${local.datacenter_name}-backend-haproxy"
  datacenter_id     = local.datacenter_id
  cores             = local.core_count
  ram               = local.ram_size
  availability_zone = local.zones.zone1
  cpu_family        = local.cpu_family
  ssh_keys          = [var.ssh_key_path]
  image_name = var.image_name

  volume {
    name      = "root"
    size      = 20
    disk_type = "SSD"
  }

  # Public lan
  nic {
    lan             = ionoscloud_lan.public_lan.id
    dhcp            = true
    firewall_active = true
  }

  # After SSH keys were initially added, any changes will be ignored.
  lifecycle {
    ignore_changes = [ssh_keys]
  }
}

# Public lan for ansible access
resource "ionoscloud_lan" "public_lan" {
  datacenter_id = local.datacenter_id
  name          = "${local.datacenter_name}-backend-haproxy-public-lan"
  public        = true
}

# Private lan for k8s cluster access
resource "ionoscloud_lan" "cluster_lan" {
  datacenter_id = local.datacenter_id
  name          = "cluster-lan"
  public        = false
}

# Private lan for crossconnect access
resource "ionoscloud_lan" "crossconnect_lan" {
  count         = length(var.crossconnects)
  datacenter_id = local.datacenter_id
  name          = "${data.ionoscloud_private_crossconnect.crossconnect[count.index].name}-lan"
  public        = false
  pcc           = data.ionoscloud_private_crossconnect.crossconnect[count.index].id
  depends_on = [
    data.ionoscloud_private_crossconnect.crossconnect
  ]
}

resource "ionoscloud_nic" "cluster_nic" {
  count         = 1
  datacenter_id = local.datacenter_id
  server_id     = ionoscloud_server.server.id
  dhcp          = true
  lan           = ionoscloud_lan.cluster_lan.id
}

resource "ionoscloud_nic" "crossconnect_nic" {
  count         = length(var.crossconnects)
  datacenter_id = local.datacenter_id
  server_id     = ionoscloud_server.server.id
  lan           = ionoscloud_lan.crossconnect_lan[count.index].id
  dhcp          = false
  ips           = [var.crossconnect_ips[count.index]]
}

resource "ionoscloud_firewall" "firewallssh" {
  datacenter_id = local.datacenter_id
  server_id     = ionoscloud_server.server.id
  nic_id        = ionoscloud_server.server.primary_nic
  protocol      = "TCP"
  name          = "ssh"
  port_range_start = 22
  port_range_end   = 22
  target_ip        = ionoscloud_server.server.primary_ip
}

resource "ionoscloud_firewall" "firewallping" {
  datacenter_id = local.datacenter_id
  server_id     = ionoscloud_server.server.id
  nic_id        = ionoscloud_server.server.primary_nic
  protocol      = "ICMP"
  name          = "ping"
  target_ip     = ionoscloud_server.server.primary_ip
}
