locals {
  nicIndex = module.cidr_workaround.nicIndex
  prefix   = module.cidr_workaround.prefix
  full_ip  = cidrhost(local.prefix, var.ip_block)
  cidr     = format("%s/%s", local.full_ip, var.subnet_mask)
}