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
  default     = "3.9.0"
}

variable "kafka_cluster_size" {
  type        = string
  description = "Size of the Kafka Cluster. Possible values: 'XS', 'S'."
  default     = "S"
}
variable "broker_addresses" {
  type = list(string)
  description = "Liste der IP-Adressen mit Subnetz für Kafka-Broker"
}


variable "kafka_lan_id" {
  type        = string
  description = "ID of the LAN whose IP we want to get"
}
