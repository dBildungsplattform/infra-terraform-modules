output "kafka_cluster_id" {
  value = ionoscloud_kafka_cluster.kafka_cluster.id
}

output "kafka_user_credentials_certificate_authority" {
  value = data.ionoscloud_kafka_user_credentials.kafka_user_credentials_ds.certificate_authority
}

output "kafka_user_credentials_certificate" {
  value = data.ionoscloud_kafka_user_credentials.kafka_user_credentials_ds.certificate
}

# todo: directly write to secret store instead when terraform module is available
output "kafka_user_credentials_private_key" {
  value = data.ionoscloud_kafka_user_credentials.kafka_user_credentials_ds.private_key
  sensitive = true
}
