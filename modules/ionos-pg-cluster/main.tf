resource "ionoscloud_pg_cluster_v2" "pg_cluster" {
  name             = var.display_name
  version          = var.postgres_version
  location         = var.datacenter_location
  replication_mode = var.synchronization_mode
  metrics_enabled  = var.metrics_enabled

  backup = {
    location       = var.backup_location
    retention_days = var.backup_retention_days
  }

  instances = {
    count        = var.instances_count
    cores        = var.cores
    ram          = var.memory / 1024
    storage_size = var.volume_size / 1024
  }

  connections = {
    datacenter_id            = var.datacenter_id
    lan_id                   = var.lan_id
    primary_instance_address = local.cidr
  }

  credentials = {
    username         = var.username
    password         = var.password
    password_version = var.password_version
    database         = var.username
  }

  maintenance_window = {
    time            = format("%02d:00:00", var.maintenance_hour)
    day_of_the_week = var.maintenance_day
  }
}

moved {
  from = ionoscloud_pg_cluster.pg_cluster
  to   = ionoscloud_pg_cluster_v2.pg_cluster
}
