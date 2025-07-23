resource "ionoscloud_lan" "kafka_lan" {
  datacenter_id = var.datacenter_id
  public        = false
  name          = "${var.datacenter_name}-kafka-lan"
}
#https://docs.ionos.com/cloud/data-analytics/kafka/overview/cluster-sizes
resource "ionoscloud_kafka_cluster" "example" {
  name     = "kafka-cluster"
  location = var.datacenter_location
  version  = "3.9.0"
  size     = "S"
  connections {
    datacenter_id = var.datacenter_id
    lan_id = ionoscloud_lan.kafka_lan.id
    broker_addresses = data.ionoscloud_kafka_cluster.broker_addresses
  }
}

resource "ionoscloud_kafka_cluster_topic" "example" {
  cluster_id           = ionoscloud_kafka_cluster.example.id
  name                 = "kafka-cluster-topic"
  location             = var.datacenter_location
  replication_factor   = var.replication_factor
  number_of_partitions = var.number_of_partitions
  retention_time       = var.retention_time
  segment_bytes        = var.segment_bytes
}