### - Outputs -----------------------------------
#
# # The local.loadbalancer_ip is created by ionoscloud_ipblock.crip.
#
output "loadbalancer_ip" {
  value = local.loadbalancer_ip
}

#
# loadbalancer_dns
#
output "loadbalancer_dns" {
  value = local.loadbalancer_dns
} 
