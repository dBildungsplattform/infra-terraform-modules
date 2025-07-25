
output "broker_addresses" {
  value = ionoscloud_kafka_cluster.kafka_cluster.connections[0].broker_addresses
}

output "kafka_cluster_id" {
  value = ionoscloud_kafka_cluster.kafka_cluster.id
}
