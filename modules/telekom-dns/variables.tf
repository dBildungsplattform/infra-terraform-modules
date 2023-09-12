variable "coordinates" {
  type = map(any)
}

variable "top_level_domain" {
  type        = map(any)
  description = "Top-level domain mapping for environments"
}

variable "domain_without_top_level" {
  type        = string
  description = "domain without top level"
}

# The dns CNAME entry
# Optional value to overwrite the default generated from the conventions.
# If not set will default to the internal_alias_dns.
variable "dns_a_entry" {
  type        = string
  description = "The dns A entry this CNAME will point to"
}

variable "dns_aliases" {
  type        = list(string)
  description = "Extra aliases"
  default     = []
}
