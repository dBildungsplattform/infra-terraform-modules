# Terraform can't handle variables in resource lifecycles (https://github.com/hashicorp/terraform/issues/3116) so this workaround is necessary
resource "ionoscloud_server" "basic_vm_server" {
  count             = var.permanent_vm ? 1 : 0
  name              = var.server_name
  datacenter_id     = var.datacenter
  cores             = var.basic_vm_server_cpu
  ram               = var.basic_vm_server_memory
  image_name        = var.image
  cpu_family        = var.cpu_family
  availability_zone = var.availability_zone
  ssh_keys          = [ local.technicaluser_key_path ]

  # /dev/vda1
  volume {
    name       = "root-volume-ssd"
    size       = var.basic_vm_volume_size
    disk_type  = "SSD Standard"
    user_data  = local.user_data
  }

  nic {
    lan             = var.create_lan ? ionoscloud_lan.basic_vm_server_lan[0].id : var.lan_id
    dhcp            = true
    ips             = concat([local.public_ip], var.additional_ips)
    firewall_active = true
    name            = "public"
  }
  # will cause Terraform to reject with an error any plan that would destroy the infrastructure object associated with the resource,
  # as long as the argument remains present in the configuration
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
        volume[0].user_data,
        ssh_keys
    ]
  }
}

resource "ionoscloud_server" "basic_vm_server_not_permanent" {
  count             = var.permanent_vm ? 0 : 1
  name              = var.server_name
  datacenter_id     = var.datacenter
  cores             = var.basic_vm_server_cpu
  ram               = var.basic_vm_server_memory
  image_name        = var.image
  cpu_family        = var.cpu_family
  availability_zone = var.availability_zone
  ssh_keys          = [ local.technicaluser_key_path ]

  # /dev/vda1
  volume {
    name       = "root-volume-ssd"
    size       = var.basic_vm_volume_size
    disk_type  = "SSD Standard"
    user_data  = local.user_data
  }

  nic {
    lan             = var.create_lan ? ionoscloud_lan.basic_vm_server_lan[0].id : var.lan_id
    dhcp            = true
    ips             = concat([local.public_ip], var.additional_ips)
    firewall_active = true
    name            = "public"
  }
  
  lifecycle {
    ignore_changes = [
        volume[0].user_data,
        cores,
        ram,
        ssh_keys
    ]
  }
}
