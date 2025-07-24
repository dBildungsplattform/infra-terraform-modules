variable "datacenter_id" {
  type        = string
  description = "ID of datacenter cluster shall be created in"
}

variable "datacenter_location" {
  type        = string
  description = "Location of datacenter cluster shall be created in"
}

variable "datacenter_name" {
  type        = string
  description = "Name of datacenter cluster shall be created in"
}

variable "replication_factor" {
  type        = number
  description = "The replication factor determines how many copies of the topic are stored on different brokers."
  default     = 3
}

variable "number_of_partitions" {
  type        = number
  description = "The number of partitions of the topic. Partition count must be >= replication factor."
  default     = 3
}

variable "retention_time" {
  type        = number
  description = "Maximum time (ms) to retain logs; if -1, no time limit is applied."
  default     = 604800000
}

variable "segment_bytes" {
  type        = number
  description = "Segment file size for the log in bytes. Larger value = fewer but larger files."
  default     = 1073741824 
}
variable "kafka_version" {
  type        = string
  description = "Version of the Kafka Cluster. Possible values: '3.8.0'."
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