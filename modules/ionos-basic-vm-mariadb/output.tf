output "basic_vm_lan_ip" {
  description = "The IP address assigned to the basic VM NIC"
  value       = ionoscloud_nic.privacyidea_vm_nic.ips[0]
}

output "database_ip_cidr" {
  description = "The CIDR block for the database IP address"
  value       = local.database_ip_cidr
}

output "database_ip" {
  description = "IP address of the MariaDB cluster"
  value = local.database_ip
}

output "basic_vm_server_dns" {
  description = "DNS record associated with the basic VM server"
  value = module.basic-vm.basic_vm_server_dns
}

output "basic_vm_server_public_ip" {
  description=  "the public IP address assigned to the basic VM server"
  value = module.basic-vm.basic_vm_server_public_ip
}