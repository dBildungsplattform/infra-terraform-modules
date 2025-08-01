variable "datacenter_id" {
  type        = string
  description = "ID of datacenter cluster shall be created in"
}
variable "datacenter_location" {
  type        = string
  description = "Location of datacenter cluster shall be created in"
}

variable "kafka_cluster_name" {
  type        = string
  description = "Name of the Kafka Cluster"
}

variable "kafka_version" {
  type        = string
  description = "Version of the Kafka Cluster."
  default = null
}

variable "kafka_cluster_size" {
  type        = string
  description = "Required. Size of the Kafka Cluster. Possible values: 'XS', 'S'.'M','L','XL'"
  default = null
}
variable "broker_addresses" {
  type = list(string)
  description = "IP addresses and subnet of cluster brokers"
}


variable "kafka_lan_id" {
  type        = string
  description = "ID of the LAN whose IP we want to get"
}
