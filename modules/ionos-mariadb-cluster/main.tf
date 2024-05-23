resource "ionoscloud_mariadb_cluster" "mariadb_cluster" {
  mariadb_version     = var.mariadb_version
  instances            = var.instances_count
  cores                = var.cores
  ram                  = var.memory
  storage_size         = var.volume_size
  
  connections {
    datacenter_id = var.datacenter_id
    lan_id        = var.lan_id
    cidr          = local.cidr
  }
  display_name         = var.display_name

  maintenance_window {
    day_of_the_week = var.maintenance_day
    time            = format("%02d:00:00", var.maintenance_hour)
  }
  
  credentials {
    username = var.username
    password = var.password
  }
 
}
