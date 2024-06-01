locals {
  technicaluser_key_path = var.initial_public_key
  public_ip = var.create_ip_pool ? ionoscloud_ipblock.public_ip[0].ips[0] : var.public_ip
  dns_zone_name = var.dns_zone_name_override == "" ? module.conventions_coordinates.dns_zone_name : var.dns_zone_name_override
  basic_vm_server = var.permanent_vm ? ionoscloud_server.basic_vm_server[0] : ionoscloud_server.basic_vm_server_not_permanent[0]

  # Calculate the prefix and database_ip_cidr
  prefix = format("%s/%s", local.basic_vm_server.nic[0].ips[0], "24")
  database_ip = cidrhost(local.prefix, 1)
  database_ip_cidr = format("%s/%s", local.database_ip, "24")

  user_data_vars = {
    "initial_user" = var.initial_user
    "initial_uid" = var.initial_uid
    "initial_public_key" = file(var.initial_public_key)
  }
  user_data = base64encode(templatefile("${path.module}/${var.user_data_script}", local.user_data_vars))
}