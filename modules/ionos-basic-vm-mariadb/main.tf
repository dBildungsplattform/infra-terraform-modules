# Create a private LAN
resource "ionoscloud_lan" "mariadb_lan" {
  datacenter_id = var.datacenter_id
  public        = false
  name          = "${var.server_name}-lan-private"
}

# Create the basic VM
module "basic-vm" {
  source                            = "../../modules/ionos-basic-vm"
  coordinates                       = var.coordinates
  fulldomainname                    = var.fulldomainname
  datacenter                        = var.datacenter_id
  datacenter_location               = var.datacenter_location
  cpu_family                        = var.cpu_family
  ip_pool_name                      = var.ip_pool_name
  basic_vm_server_memory            = var.basic_vm_server_memory
  basic_vm_server_cpu               = var.basic_vm_server_cpu
  basic_vm_volume_size              = var.basic_vm_volume_size
  basic_vm_second_volume_size       = var.basic_vm_second_volume_size
  basic_vm_second_volume_disk_type  = var.basic_vm_second_volume_disk_type
  domain_without_top_level          = var.domain_without_top_level
  top_level_domain                  = var.top_level_domain
  image                             = var.image
  server_name                       = var.server_name
  ports                             = var.ports
  create_lan                        = var.create_lan

# Ensure the private LAN is created before the basic VM
  depends_on = [ionoscloud_lan.mariadb_lan]

  initial_user       = "technicaluser"
  initial_uid        = "2215"
  initial_public_key = "../../../provision/sshkeys/technicaluser.pub"
}

# Create a NIC for the basic VM and connect it to the private LAN
resource "ionoscloud_nic" "privacyidea_vm_nic" {
  datacenter_id = var.datacenter_id
  server_id     = module.basic-vm.basic_vm_server_id
  dhcp          = true
  lan           = ionoscloud_lan.mariadb_lan.id
  firewall_active = true
}

# Create the MariaDB cluster
resource "ionoscloud_mariadb_cluster" "mariadb_cluster" {
  mariadb_version      = var.mariadb_version
  instances            = var.mariadb_instances_count
  cores                = var.mariadb_cores
  ram                  = var.mariadb_memory
  storage_size         = var.mariadb_storage_size
  display_name         = var.mariadb_display_name

  connections {
    datacenter_id = var.datacenter_id
    lan_id        = ionoscloud_lan.mariadb_lan.id
    cidr          = local.database_ip_cidr
  }

  maintenance_window {
    day_of_the_week    = var.maintenance_day
    time               = format("%02d:00:00", var.maintenance_hour)
  }

  credentials {
    username = var.mariadb_username
    password = var.mariadb_password
  }
}