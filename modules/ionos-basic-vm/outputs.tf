output "basic_vm_server_id" {
    value = local.basic_vm_server.id
}

output "basic_vm_server_dns" {
    value = trim(join("", opentelekomcloud_dns_recordset_v2.a_records.*.name), ".")
}

output "basic_vm_server_public_ip" {
    value = local.basic_vm_server.primary_ip
}

output "basic_vm_server_nicuuid" {
  value = local.basic_vm_server.nic[*].id
}