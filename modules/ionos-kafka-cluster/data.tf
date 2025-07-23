data "ionoscloud_kafka_cluster" "broker_addresses" {
  name     = "kafka-cluster"
  location = var.datacenter_location
}