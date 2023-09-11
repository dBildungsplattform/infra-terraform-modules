variable "coordinates" {
  type = map(any)
}
variable "domain_without_top_level" {
  type        = string
  description = "The domain, without top level"
  default     = ""
}
variable "top_level_domain" {
  description = "Top-level domain mapping for environments"
  type        = map(any)
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