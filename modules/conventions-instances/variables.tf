
### - variables ---------------------------------
#
# The stage. Examples: 'prod', 'staging', 'dev'. */
#
variable "stage" {
  type        = string
  description = "represent the stage environment, such as 'prod', 'staging', or 'dev'"
  default     = "dev"
}
#
#The domain, without top level.
#E.g. "hpi-schul-cloud" 
#
variable "domain_without_top_level" {
  type        = string
  description = "The domain, without top level"
  default     = "<domain>"
}

#
#The top level domain. 
#
variable "top_level_domain" {
  type        = string
  description = "The top level domain"
}

