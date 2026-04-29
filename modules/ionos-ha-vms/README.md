<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | ~>6.4 |
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider\_opentelekomcloud) | n/a |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_conventions_coordinates"></a> [conventions\_coordinates](#module\_conventions\_coordinates) | ../conventions-coordinates | n/a |
| <a name="module_ha_backup_vms"></a> [ha\_backup\_vms](#module\_ha\_backup\_vms) | ../ionos-basic-vm/ | n/a |
| <a name="module_ha_main_vm"></a> [ha\_main\_vm](#module\_ha\_main\_vm) | ../ionos-basic-vm/ | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | n/a | `map(any)` | n/a | yes |
| <a name="input_cpu_family"></a> [cpu\_family](#input\_cpu\_family) | n/a | `string` | n/a | yes |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | n/a | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | n/a | `string` | n/a | yes |
| <a name="input_domain_base"></a> [domain\_base](#input\_domain\_base) | Domains will be <name>[-<index>].<domain\_base> | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | domain without top level | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | image of the vm | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | name of the ha cluster, used for names the components and the domain | `string` | n/a | yes |
| <a name="input_server_cpu"></a> [server\_cpu](#input\_server\_cpu) | cpus of the vm servers | `number` | n/a | yes |
| <a name="input_server_memory"></a> [server\_memory](#input\_server\_memory) | memory of the vm servers | `number` | n/a | yes |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | Top-level domain mapping for environments | `map(any)` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | volume size for vm | `number` | n/a | yes |
| <a name="input_create_second_volume"></a> [create\_second\_volume](#input\_create\_second\_volume) | n/a | `bool` | `true` | no |
| <a name="input_ha_node_count"></a> [ha\_node\_count](#input\_ha\_node\_count) | Number of VMs/Nodes in the HA Cluster | `number` | `2` | no |
| <a name="input_initial_public_key"></a> [initial\_public\_key](#input\_initial\_public\_key) | The public key of the initial user created via the cloud init script. | `string` | `""` | no |
| <a name="input_initial_uid"></a> [initial\_uid](#input\_initial\_uid) | The uid of the initial user created via the cloud init script. | `string` | `""` | no |
| <a name="input_initial_user"></a> [initial\_user](#input\_initial\_user) | The initial user to be created via the cloud init script. | `string` | `""` | no |
| <a name="input_permanent_vm"></a> [permanent\_vm](#input\_permanent\_vm) | Create a permanent VM that mustn't be deleted, if false then a VM that can be deleted and that ignores changes to ram and cpu is created | `bool` | `true` | no |
| <a name="input_port_ranges"></a> [port\_ranges](#input\_port\_ranges) | port rangs to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port\_start = ???, port\_end, source\_ip = ???}], source\_ip is optional. | `list` | `[]` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | ports to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port = ???, source\_ip = ???}], source\_ip is optional. | `list` | `[]` | no |
| <a name="input_second_volume_disk_type"></a> [second\_volume\_disk\_type](#input\_second\_volume\_disk\_type) | n/a | `string` | `"HDD"` | no |
| <a name="input_second_volume_size"></a> [second\_volume\_size](#input\_second\_volume\_size) | size of the second volume | `string` | `100` | no |
| <a name="input_user_data_script"></a> [user\_data\_script](#input\_user\_data\_script) | Decide which user-data.sh script to use | `string` | `"user-data-cloud-init.tpl"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ha_common_address"></a> [ha\_common\_address](#output\_ha\_common\_address) | n/a |
| <a name="output_ha_dns_name"></a> [ha\_dns\_name](#output\_ha\_dns\_name) | n/a |
| <a name="output_ha_internal_lan_id"></a> [ha\_internal\_lan\_id](#output\_ha\_internal\_lan\_id) | n/a |
| <a name="output_ha_public_lan_id"></a> [ha\_public\_lan\_id](#output\_ha\_public\_lan\_id) | n/a |
| <a name="output_ha_vms_server_id"></a> [ha\_vms\_server\_id](#output\_ha\_vms\_server\_id) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | ~>6.4 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_ipblock.floating_ip](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/ipblock) | resource |
| [ionoscloud_ipblock.node_ips](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/ipblock) | resource |
| [ionoscloud_ipfailover.failover](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/ipfailover) | resource |
| [ionoscloud_lan.lan_internal](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/lan) | resource |
| [ionoscloud_lan.lan_public](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/lan) | resource |
| [ionoscloud_nic.private_nic_backup_vms](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/nic) | resource |
| [ionoscloud_nic.private_nic_main_vm](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/nic) | resource |
| [opentelekomcloud_dns_recordset_v2.a_records](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2) | resource |
| [opentelekomcloud_dns_zone_v2.dns_zone](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/dns_zone_v2) | data source |
<!-- END_TF_DOCS -->