output "basic_vm_server_id" {
    value = local.basic_vm_server.id
}

output "basic_vm_server_dns" {
    value = trim(opentelekomcloud_dns_recordset_v2.a_records.name, ".")
}

output "basic_vm_server_public_ip" {
    value = local.basic_vm_server.primary_ip
}

output "basic_vm_server_nicuuid" {
  value = local.basic_vm_server.nic[*].id
}

output "basic_vm_server_name" {
  value = var.server_name
}

output "basic_vm_root_volume_id" {
  value = var.permanent_vm ? {
    value = ionoscloud_server.basic_vm_server[0].inline_volume_ids  
  }:{
    value = ionoscloud_server.basic_vm_server_not_permanent[0].inline_volume_ids
  }
  description = "The ID of the root volume attached to the basic VM server."
}