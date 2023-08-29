#
# loadbalancer_ip
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
