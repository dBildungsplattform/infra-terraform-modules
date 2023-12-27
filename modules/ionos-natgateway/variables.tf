variable "datacenter_id" {
  description = ""
  type        = string
}

variable "natgateway_name" {
  description = ""
  type        = string
}

variable "natgateway_public_ips" {
  description = "Specifies the list of public ips of the NAT gateway."
  type        = list(string)
}

variable "k8s_cluster_id" {
  description = ""
  type        = string
}

variable "lan_id" {
  description = "The LAN to connect the NAT gateway to."
  type        = string
}

variable "natgateway_host_num" {
  description = "The number to be set in the last ip block. (Default: 8)"
  type        = number
  default     = 8
}

variable "natgateway_rule_name" {
  description = ""
  type        = string
}

variable "create_ipblock" {
  description = "Specifies whether an ipblock should be created. Default: false."
  type        = bool
  default     = false
}

variable "datacenter_location" {
  description = ""
  type        = string
  default     = null
}

variable "ipblock_name" {
  description = ""
  type        = string 
  default     = null
} 

variable "ipblock_size" {
  description = ""
  type        = number
  default     = null
}