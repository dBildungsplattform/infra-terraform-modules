locals {
 prefix                   = format("%s/%s", ionoscloud_nic.privacyidea_vm_nic.ips[0], "24")
 database_ip              = cidrhost(local.prefix, 1)
 database_ip_cidr         = format("%s/%s", local.database_ip, "24")
}