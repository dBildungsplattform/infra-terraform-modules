locals {
  basic_vm_lan_ip           = ionoscloud_nic.basic_vm_nic.ips[0] # Assuming the NIC has at least one IP address
  private_lan_cidr          = "${cidrsubnet(ionoscloud_nic.basic_vm_nic.ips[0], 24, 0)}" # Assuming a /24 subnet
  mariadb_cluster_lan_cidr  = "${cidrsubnet(local.private_lan_cidr, 4, 1)}"
  mariadb_cluster_lan_ip    = cidrhost(local.mariadb_cluster_lan_cidr, 9)
}

# let's assume that private LAN was created with a CIDR range of 10.0.0.0/24
# private_lan_cidr = 10.0.0.0/24
#basic_vm_lan_ip =10.0.0.9
#mariadb_cluster_lan_cidr=10.0.1.0
#mariadb_cluster_lan_ip    = "10.0.1.10"