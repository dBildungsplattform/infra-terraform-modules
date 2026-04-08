data "ionoscloud_kafka_users" "kafka_cluster_users" {
  cluster_id = ionoscloud_kafka_cluster.kafka_cluster.id
  location = ionoscloud_kafka_cluster.kafka_cluster.location
}

data "ionoscloud_kafka_user_credentials" "kafka_cluster_user_credentials" {
  cluster_id = ionoscloud_kafka_cluster.kafka_cluster.id
  location = ionoscloud_kafka_cluster.kafka_cluster.location
  id = one(data.ionoscloud_kafka_users.kafka_cluster_users.users[*].id)
}
