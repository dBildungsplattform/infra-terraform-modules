resource ionoscloud_mongo_cluster "mongo_cluster" {
  mongodb_version      = var.mongo_version
  instances            = var.instances_count
  shards               = var.shards_count
  type                 = var.shards_count == null ? "replicaset" : "sharded-cluster"
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

  template_id = data.null_data_source.template_workaround.outputs["mongo_template_id"]
  edition     = var.resource_template == null ? "enterprise" : null

  maintenance_window {
    day_of_the_week = var.maintenance_day
    time            = format("%02d:00:00", var.maintenance_hour)
  }
}

resource "ionoscloud_mongo_user" "initial_mongo_user" {
  for_each   = var.users
  cluster_id = ionoscloud_mongo_cluster.mongo_cluster.id
  username   = each.key
  password   = each.value.password
  dynamic "roles" {
    for_each = each.value.roles
    content {
      role = roles.value["role"]
      database = roles.value["db"]
    }
  }
}
