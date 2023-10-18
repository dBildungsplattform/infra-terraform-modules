output "alb_ip" {
  value = ionoscloud_ipblock.alb.ips[0]
}
