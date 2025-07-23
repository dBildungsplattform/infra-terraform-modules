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

variable "kafka_cluster_broker_ips_cidr" {
  type = list
  description = "IP address and port of cluster brokers"
  default = []
}