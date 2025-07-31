resource "ionoscloud_kafka_cluster" "kafka_cluster" {
  name     = var.kafka_cluster_name
  location = var.datacenter_location
  version  = var.kafka_version
  size     = var.kafka_cluster_size
  connections {
    datacenter_id = var.datacenter_id
    lan_id = var.kafka_lan_id
    broker_addresses = var.broker_addresses
  }
}