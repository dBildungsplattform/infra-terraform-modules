
/* The coordinates for the generated infrastructure, employed for identifying
structural elements dispersed across various services or locations
that are interconnected. 
Examples:
project=dbp, stage=prod, scope=legacy, index="" > dbp-prod-legacy
project=playground, stage=dev, scope=marbarte, index=01 > playground-dev-marbarte-01
 */

variable "coordinates" {
  type = map(any)
  default = {
    "project" = "<project>"
    "stage"   = "<stage>"
    "scope"   = "<scope>"
    "index"   = "<index>"
  }
}
/* top_level_domain
For Example : de */

variable "top_level_domain" {
  type          = map(any)
  description   = "define top level domains"
  default       = {
    "prod"      = "<top level domain for prod>"
    "staging"   = "<top level domain for staging>"
    "test"      = "<top level domain test>"
    "dev"       = "<top level domain for dev>"
}
}
/* 
The domain, without top level.
E.g. "dBildungsplattform */

variable "domain_without_top_level" {
  type        = string
  description = ""
  default     = "<domain>"
}

