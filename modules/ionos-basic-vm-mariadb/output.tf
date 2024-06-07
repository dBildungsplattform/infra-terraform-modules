output "basic_vm_lan_ip" {
  description = "The IP address assigned to the basic VM NIC"
  value       = ionoscloud_nic.basic_vm_nic.ips[0]
}

output "private_lan_id" {
  description = "The ID of the private LAN for the privacyidea VM and MariaDB cluster"
  value       = data.ionoscloud_lan.private_lan.id
}

output "database_ip_cidr" {
  description = "The CIDR block for the database IP address"
  value       = local.database_ip_cidr
}

output "database_ip" {
  description = "IP address of the MariaDB cluster"
  value = local.database_ip
}