resource "ionoscloud_pg_cluster" "pg_cluster" {
  postgres_version     = var.postgres_version
  instances            = var.instances_count
  cores                = var.cores
  ram                  = var.memory
  storage_size         = var.volume_size
  storage_type         = var.volume_disk_type
  display_name         = var.display_name
  location             = var.datacenter_location
  synchronization_mode = var.synchronization_mode

  connections {
    datacenter_id = var.datacenter_id
    lan_id        = var.postgres_lan_id
    cidr          = local.cidr
  }

  credentials {
    username = var.username
    password = var.password
  }
  maintenance_window {
    day_of_the_week = var.maintenance_day
    time            = format("%02d:00:00", var.maintenance_hour)
  }
}
