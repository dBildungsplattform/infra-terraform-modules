variable "datacenter_name" {
  type        = string
  description = ""
}

variable "datacenter_location" {
  type        = string
  description = ""
  default     = "de/txl"
}

variable "create_frontend_crossconnect" {
  type        = bool
  description = "Specifies whether crossconnect shall be created. Default: false."
  default     = false
}

variable "associated_frontend_crossconnect_id" {
  type        = string
  description = "Specifies whether an existing crossconnect shall be associated."
  default     = ""
}

variable "create_backend_crossconnect" {
  type        = bool
  description = "Specifies whether crossconnect shall be created. Default: false."
  default     = false
}

variable "associated_backend_crossconnect_id" {
  type        = string
  description = "Specifies whether an existing crossconnect shall be associated."
  default     = ""
}

variable "create_service_crossconnect" {
  type        = bool
  description = "Specifies whether crossconnect shall be created. Default: false."
  default     = false
}

variable "associated_service_crossconnect_id" {
  type        = string
  description = "Specifies whether an existing crossconnect shall be associated."
  default     = ""
}

variable "create_public_lan" {
  type        = bool
  description = "Specifies whether a public lan shall be created. Default: false."
  default     = false
}

variable "crossconnect_shared_group_ids" {
  type        = list(string)
  description = "Specifies which groups crossconnect shall be shared with. Default: []."
  default     = []
}

variable "routes_map" {
  type = any
  description = "map which links based on the lan id to a list in which the routes in form of an object ('network'='###' and 'gateway_ip'='###') are saved"
  default = {}
}

variable "create_nfs_server_lan" {
  type = bool
  description = "Specifies whether a private lan to connect an NFS server shall be created."
  default = false
}