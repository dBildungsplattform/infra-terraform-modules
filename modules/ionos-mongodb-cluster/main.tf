resource ionoscloud_mongo_cluster "mongo_cluster" {
  mongodb_version      = var.mongo_version
  instances            = var.instances_count
  cores                = var.cores
  ram                  = var.memory
  storage_size         = var.volume_size
  storage_type         = var.volume_disk_type
  display_name         = var.display_name
  location             = var.datacenter_location

  connections {
    datacenter_id = var.datacenter_id
    lan_id        = var.lan_id
    cidr_list     = local.cidrs
  }

  template_id = var.resource_template == null ? null : data.ionoscloud_mongo_template.mongo_template[0].id

  maintenance_window {
    day_of_the_week = var.maintenance_day
    time            = format("%02d:00:00", var.maintenance_hour)
  }
}

resource "ionoscloud_mongo_user" "initial_mongo_user" {
  cluster_id = ionoscloud_mongo_cluster.mongo_cluster.id
  username = var.username
  password = var.password
  roles {
    role = var.role
    database = "admin"
  }
}
