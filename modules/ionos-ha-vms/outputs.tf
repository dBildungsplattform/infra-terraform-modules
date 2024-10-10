output "ha_internal_lan_id" {
  value = ionoscloud_lan.lan_internal.id
}

output "ha_dns_name" {
  value = opentelekomcloud_dns_recordset_v2.a_records.name
}

output "ha_common_address" {
  value = ionoscloud_ipblock.floating_ip.ips[0]
}

output "ha_vms_server_id" {
    value = concat([module.ha_main_vm.basic_vm_server_id],module.ha_backup_vms[*].basic_vm_server_id)
}
