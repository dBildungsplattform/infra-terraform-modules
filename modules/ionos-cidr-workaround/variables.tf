variable "k8s_cluster_id" {
  type        = string
  description = "UUID of the Kubernetes cluster that the LAN is in"
}
variable "lan_id" {
  type        = string
  description = "ID of the LAN whose IP we want to get"
}