#
# The registered dns CNAME for the service.
#
 output "service_dns" {
  value = local.service_dns
} 
#
# dns_a_entry
# Example: dBildungsplattform.de.
 output "dns_a_entry" {
  value = local.dns_a_entry
  
} 