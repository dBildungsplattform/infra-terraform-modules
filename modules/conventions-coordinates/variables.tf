
/* Not setting default values encourages explicit configuration,ensuring precise values
are provided for each variable, which is important for customization and 
avoids unintentional default values. */

### - Variables ---------------------------------
#The coordinates for the generated infrastructure, employed for identifying
#structural elements dispersed across various services or locations that are interconnected. 
#Examples:
#project=sc, stage=prod, scope=schulcloud, index="" > sc-prod-schulcloud
#project=infra, stage=dev, scope=schulcloud, index=01 > infra-dev-schulcloud-01
#


variable "coordinates" {
  type = map(any)
}
#
#top_level_domain
#For Example : de */
#
variable "top_level_domain" {
  type          = map(any)
  description   = "define top level domains"
}
#
#The domain, without top level.
#E.g. "dBildungsplattform 
#
variable "domain_without_top_level" {
  type        = string
  description = "Domain name "
}

