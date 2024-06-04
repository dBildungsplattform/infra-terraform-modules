# Create a private LAN
resource "ionoscloud_lan" "private_lan" {
  datacenter_id = var.datacenter_id
  public        = false
  name          = "${var.server_name}-private"
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
  basic_vm_server_memory            = var.server_memory
  basic_vm_server_cpu               = var.server_cpu
  basic_vm_volume_size              = var.volume_size
  basic_vm_second_volume_size       = var.second_volume_size
  basic_vm_second_volume_disk_type  = var.second_volume_disk_type
  domain_without_top_level          = var.domain_without_top_level
  top_level_domain                  = var.top_level_domain
  image                             = var.image
  server_name                       = var.server_name
  ports                             = var.ports
  create_lan                        = true


# Ensure the private LAN is created before the basic VM
  depends_on = [ionoscloud_lan.private_lan]

  initial_user       = "technicaluser"
  initial_uid        = "2215"
  initial_public_key = "../../../provision/sshkeys/technicaluser.pub"
}

# Create a NIC for the basic VM and connect it to the private LAN
resource "ionoscloud_nic" "basic_vm_nic" {
  datacenter_id = var.datacenter_id
  server_id     = module.basic-vm.basic_vm_server_id
  dhcp          = false
  lan           = ionoscloud_lan.private_lan.id
  ips           = [local.basic_vm_lan_ip]
  firewall_active = true
}

# Create the MariaDB cluster
resource "ionoscloud_mariadb_cluster" "mariadb_cluster" {
  mariadb_version      = var.mariadb_version
  instances            = var.instances_count
  cores                = var.cores
  ram                  = var.memory
  storage_size         = var.volume_size
  display_name         = var.display_name
  #the private LAN ID, and the CIDR range for the MariaDB cluster
  #basic VM and the MariaDB cluster are connected to the same private LAN  
  connections {
    datacenter_id = var.datacenter_id
    lan_id        = ionoscloud_lan.private_lan.id
    cidr          = local.mariadb_cluster_lan_cidr
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
