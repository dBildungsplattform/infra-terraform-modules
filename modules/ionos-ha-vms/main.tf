module "conventions_coordinates" {
  source                   = "../conventions-coordinates"
  coordinates              = var.coordinates
  domain_without_top_level = var.domain_without_top_level
  top_level_domain         = var.top_level_domain
}

# This VM has to be created seperatly because:
# It has to exist when the failover is created (defined as master)
# The other VM(s) can only be created after the Failover IP is configured,
# otherwise you get an error because the IP is already in use by the first VM
module "ha_main_vm" {
  source                            = "../ionos-basic-vm/"
  coordinates                       = var.coordinates
  fulldomainname                    = "${var.name}-0.${var.domain_base}"
  datacenter                        = var.datacenter
  datacenter_location               = var.datacenter_location
  create_lan                        = false
  lan_id                            = ionoscloud_lan.lan_public.id
  cpu_family                        = var.cpu_family
  availability_zone                 = local.availability_zones[0]
  image                             = var.image
  server_name                       = "${var.name}-0"
  ports                             = var.ports
  port_ranges                       = var.port_ranges
  create_ip_pool                    = false
  public_ip                         = ionoscloud_ipblock.node_ips.ips[0]
  additional_ips                    = [ionoscloud_ipblock.floating_ip.ips[0]]
  basic_vm_server_memory            = var.server_memory
  basic_vm_server_cpu               = var.server_cpu
  basic_vm_volume_size              = var.volume_size
  domain_without_top_level          = var.domain_without_top_level
  top_level_domain                  = var.top_level_domain
  basic_vm_create_second_volume     = var.create_second_volume
  basic_vm_second_volume_disk_type  = var.second_volume_disk_type
  basic_vm_second_volume_size       = var.second_volume_size
  permanent_vm                      = var.permanent_vm
  user_data_script                  = var.user_data_script

  depends_on = [ ionoscloud_lan.lan_public ]

  initial_user = var.initial_user
  initial_uid = var.initial_uid
  initial_public_key = file(var.initial_public_key)
}

resource "ionoscloud_nic" "private_nic_main_vm" {
  count                 = var.ha_node_count - 1
  datacenter_id         = var.datacenter
  server_id             = module.ha_main_vm.basic_vm_server_id
  lan                   = ionoscloud_lan.lan_internal.id
  dhcp                  = true
  firewall_active       = false
}

module "ha_backup_vms" {
  count                             = var.ha_node_count - 1
  source                            = "../ionos-basic-vm/"
  coordinates                       = var.coordinates
  fulldomainname                    = "${var.name}-${count.index+1}.${var.domain_base}"
  datacenter                        = var.datacenter
  datacenter_location               = var.datacenter_location
  create_lan                        = false
  lan_id                            = ionoscloud_lan.lan_public.id
  cpu_family                        = var.cpu_family
  availability_zone                 = local.availability_zones[(count.index+1)%2]
  image                             = var.image
  server_name                       = "${var.name}-${count.index+1}"
  ports                             = var.ports
  port_ranges                       = var.port_ranges
  create_ip_pool                    = false
  public_ip                         = ionoscloud_ipblock.node_ips.ips[count.index+1]
  additional_ips                    = [ionoscloud_ipblock.floating_ip.ips[0]]
  basic_vm_server_memory            = var.server_memory
  basic_vm_server_cpu               = var.server_cpu
  basic_vm_volume_size              = var.volume_size
  domain_without_top_level          = var.domain_without_top_level
  top_level_domain                  = var.top_level_domain
  basic_vm_create_second_volume     = var.create_second_volume
  basic_vm_second_volume_disk_type  = var.second_volume_disk_type
  basic_vm_second_volume_size       = var.second_volume_size
  permanent_vm                      = var.permanent_vm
  user_data_script                  = var.user_data_script

  depends_on = [ ionoscloud_lan.lan_public, ionoscloud_ipfailover.failover ]

  initial_user = var.initial_user
  initial_uid = var.initial_uid
  initial_public_key = file(var.initial_public_key)
}

resource "ionoscloud_nic" "private_nic_backup_vms" {
  count                 = var.ha_node_count - 1
  datacenter_id         = var.datacenter
  server_id             = module.ha_backup_vms[count.index].basic_vm_server_id
  lan                   = ionoscloud_lan.lan_internal.id
  dhcp                  = true
  firewall_active       = false
}

resource "ionoscloud_ipblock" "floating_ip" {
  name     = "${module.conventions_coordinates.global_identifier}-${var.name}"
  location = var.datacenter_location
  size     = 1
}

resource "ionoscloud_ipblock" "node_ips" {
  name     = "${module.conventions_coordinates.global_identifier}-${var.name}-nodes"
  location = var.datacenter_location
  size     = var.ha_node_count
}

resource "ionoscloud_lan" "lan_public" {
  datacenter_id = var.datacenter
  public        = true
  name          = "${var.name}-public"
}

resource "ionoscloud_lan" "lan_internal" {
  datacenter_id         = var.datacenter
  public                = false
  name                  = "${var.name}-private"
}

resource "ionoscloud_ipfailover" "failover" {
  datacenter_id         = var.datacenter
  lan_id                = ionoscloud_lan.lan_public.id
  ip                    = ionoscloud_ipblock.floating_ip.ips[0]
  nicuuid               = module.ha_main_vm.basic_vm_server_nicuuid[0]
}

resource "opentelekomcloud_dns_recordset_v2" "a_records" {
  zone_id = data.opentelekomcloud_dns_zone_v2.dns_zone.id
  name    = "${var.name}.${var.domain_base}"
  ttl     = 3600
  type    = "A"
  records = [ionoscloud_ipblock.floating_ip.ips[0]]
  lifecycle {
    ignore_changes = [zone_id]
  }
}
