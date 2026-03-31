data "ionoscloud_kafka_users" "kafka_users_ds" {
  cluster_id = ionoscloud_kafka_cluster.kafka_cluster.id
  timeouts = {
    read = "1s"
  }
}

data "ionoscloud_kafka_user_credentials" "kafka_user_credentials_ds" {
  cluster_id = ionoscloud_kafka_cluster.kafka_cluster.id
  location = ionoscloud_kafka_cluster.kafka_cluster.location
  id = one(data.ionoscloud_kafka_users.kafka_users_ds.users[*])
  timeouts = {
    read = "1m"
  }
}
