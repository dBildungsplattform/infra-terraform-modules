locals {
  #ionoscloud_lan data source that returns the CIDR range of the private LAN
  private_lan_cidr          = data.ionoscloud_lan.private_lan.X
  basic_vm_lan_ip           = cidrhost(local.private_lan_cidr, 9)
  mariadb_cluster_lan_cidr  = "${cidrsubnet(local.private_lan_cidr, 4, 1)}"
  mariadb_cluster_lan_ip    = cidrhost(local.mariadb_cluster_lan_cidr, 9)
}

# let's assume that private LAN was created with a CIDR range of 10.0.0.0/24
# private_lan_cidr = 10.0.0.0/24
#basic_vm_lan_ip =10.0.0.9
#mariadb_cluster_lan_cidr=10.0.1.0
#mariadb_cluster_lan_ip    = "10.0.1.10"