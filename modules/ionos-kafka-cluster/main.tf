

#https://docs.ionos.com/cloud/data-analytics/kafka/overview/cluster-sizes
resource "ionoscloud_kafka_cluster" "kafka_cluster" {
  name     = "kafka-cluster"
  location = var.datacenter_location
  version  = var.kafka_version
  size     = var.kafka_cluster_size
  connections {
    datacenter_id = var.datacenter_id
    lan_id = var.kafka_lan_id
    broker_addresses = var.broker_addresses
  }
}

resource "ionoscloud_kafka_cluster_topic" "kafka_cluster_topic" {
  cluster_id           = ionoscloud_kafka_cluster.kafka_cluster.id
  name                 = "kafka-cluster-topic"
  location             = var.datacenter_location
  replication_factor   = var.replication_factor
  number_of_partitions = var.number_of_partitions
  retention_time       = var.retention_time
  segment_bytes        = var.segment_bytes
}