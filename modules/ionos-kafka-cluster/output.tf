output "kafka_cluster_id" {
  value = ionoscloud_kafka_cluster.kafka_cluster.id
}

output "kafka_cluster_certificate_authority" {
  value = data.ionoscloud_kafka_user_credentials.kafka_cluster_user_credentials.certificate_authority
}

output "kafka_cluster_certificate" {
  value = data.ionoscloud_kafka_user_credentials.kafka_cluster_user_credentials.certificate
}

output "kafka_cluster_private_key" {
  value = data.ionoscloud_kafka_user_credentials.kafka_cluster_user_credentials.private_key
  sensitive = true
}
