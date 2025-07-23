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
    broker_addresses = var.kafka_cluster_broker_ips_cidr
  }
}