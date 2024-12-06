output "alb_ip" {
  value = ionoscloud_ipblock.alb.ips[0]
}

output "alb_id" {
  value = ionoscloud_application_loadbalancer.alb.id
}
