 # Example: project=sc, stage=prod, scope=schulcloud, index="" > sc-prod-schulcloud
variable "coordinates" {
  type = map(any)
  description = "The coordinates for the generated infrastructure, employed for identifying structural elements"
}

variable "top_level_domain" {
  type          = map(any)
  description   = "define top level domains"
}

variable "domain_without_top_level" {
  type        = string
  description = "domain without top level"
}
