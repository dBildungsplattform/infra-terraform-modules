output "basic_vm_lan_ip" {
  description = "The IP address assigned to the basic VM NIC"
  value       = ionoscloud_nic.basic_vm_nic.ips[0]
}

output "mariadb_cluster_lan_ip" {
  description = "The IP address for the MariaDB cluster within the calculated CIDR range"
  value       = local.mariadb_cluster_lan_ip
}

output "private_lan_cidr" {
  description = "represents the CIDR range of the private LAN created for the basic VM and MariaDB cluster"
  value       = local.private_lan_cidr
}

output "mariadb_cluster_lan_cidr" {
  description = "Is calculating the CIDR range for the MariaDB cluster LAN by taking a subnet of the private_lan_cidr"
  value       = local.mariadb_cluster_lan_cidr
}

output "private_lan_id" {
  description = "The ID of the private LAN for the privacyidea VM and MariaDB cluster"
  value       = data.ionoscloud_lan.private_lan.id
}