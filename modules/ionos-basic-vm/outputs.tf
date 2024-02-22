output "basic_vm_server_id" {
    value = local.basic_vm_server.id
}

output "basic_vm_server_public_ip" {
    value = local.basic_vm_server.primary_ip
}
