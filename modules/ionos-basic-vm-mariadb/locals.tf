locals {
  basic_vm_lan_ip           = ionoscloud_nic.basic_vm_nic.ips[0]
  subnet_mask               = 24 

  basic_vm_lan_cidr         = "${local.basic_vm_lan_ip}/${local.subnet_mask}"

  private_lan_cidr          = local.basic_vm_lan_cidr
  mariadb_cluster_lan_cidr  = cidrsubnet(local.private_lan_cidr, 4, 1)
  mariadb_cluster_lan_ip    = cidrhost(local.mariadb_cluster_lan_cidr, 9)
}
