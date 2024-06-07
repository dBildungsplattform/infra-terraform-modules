<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.4.14 |
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider\_opentelekomcloud) | n/a |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_conventions_coordinates"></a> [conventions\_coordinates](#module\_conventions\_coordinates) | ../conventions-coordinates | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basic_vm_server_cpu"></a> [basic\_vm\_server\_cpu](#input\_basic\_vm\_server\_cpu) | cpu of the basic vm servers | `number` | n/a | yes |
| <a name="input_basic_vm_server_memory"></a> [basic\_vm\_server\_memory](#input\_basic\_vm\_server\_memory) | memory of the basic vm servers | `number` | n/a | yes |
| <a name="input_basic_vm_volume_size"></a> [basic\_vm\_volume\_size](#input\_basic\_vm\_volume\_size) | volume size for vm | `number` | n/a | yes |
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | n/a | `map(any)` | n/a | yes |
| <a name="input_cpu_family"></a> [cpu\_family](#input\_cpu\_family) | n/a | `string` | n/a | yes |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | n/a | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | n/a | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | domain without top level | `string` | n/a | yes |
| <a name="input_fulldomainname"></a> [fulldomainname](#input\_fulldomainname) | Domain under which the basic vm server will be available | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | image of the vm | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | name of the vm | `string` | n/a | yes |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | Top-level domain mapping for environments | `map(any)` | n/a | yes |
| <a name="input_additional_ips"></a> [additional\_ips](#input\_additional\_ips) | Additional IPs for the VM (optional) | `list(string)` | `[]` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Possible Zones: AUTO, ZONE\_1, ZONE\_2 | `string` | `"AUTO"` | no |
| <a name="input_basic_vm_create_second_volume"></a> [basic\_vm\_create\_second\_volume](#input\_basic\_vm\_create\_second\_volume) | n/a | `bool` | `true` | no |
| <a name="input_basic_vm_second_volume_disk_type"></a> [basic\_vm\_second\_volume\_disk\_type](#input\_basic\_vm\_second\_volume\_disk\_type) | n/a | `string` | `"HDD"` | no |
| <a name="input_basic_vm_second_volume_size"></a> [basic\_vm\_second\_volume\_size](#input\_basic\_vm\_second\_volume\_size) | size of the second volume | `string` | `100` | no |
| <a name="input_create_ip_pool"></a> [create\_ip\_pool](#input\_create\_ip\_pool) | If true an IP pool of size 1 will be created, if false a public IP must be provided | `bool` | `true` | no |
| <a name="input_create_lan"></a> [create\_lan](#input\_create\_lan) | If true a LAN will be created, if false a LAN ID must be provided | `bool` | `true` | no |
| <a name="input_dns_zone_name_override"></a> [dns\_zone\_name\_override](#input\_dns\_zone\_name\_override) | Name of the DNS zone if it doesn't follow the naming convention (i.e. messenger.schule) | `string` | `""` | no |
| <a name="input_initial_public_key"></a> [initial\_public\_key](#input\_initial\_public\_key) | The public key of the initial user created via the cloud init script. | `string` | `""` | no |
| <a name="input_initial_uid"></a> [initial\_uid](#input\_initial\_uid) | The uid of the initial user created via the cloud init script. | `string` | `""` | no |
| <a name="input_initial_user"></a> [initial\_user](#input\_initial\_user) | The initial user to be created via the cloud init script. | `string` | `""` | no |
| <a name="input_ip_pool_name"></a> [ip\_pool\_name](#input\_ip\_pool\_name) | Name of the ip pools | `string` | `""` | no |
| <a name="input_lan_id"></a> [lan\_id](#input\_lan\_id) | Id of the LAN to use (only necessary if create\_lan is false) | `number` | `null` | no |
| <a name="input_permanent_vm"></a> [permanent\_vm](#input\_permanent\_vm) | Create a permanent VM that mustn't be deleted, if false then a VM that can be deleted and that ignores changes to ram and cpu is created | `bool` | `true` | no |
| <a name="input_port_ranges"></a> [port\_ranges](#input\_port\_ranges) | port rangs to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port\_start = ???, port\_end = ???, source\_ip = ???}], source\_ip is optional. | `list` | `[]` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | ports to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port = ???, source\_ip = ???}], source\_ip is optional. | `list` | `[]` | no |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | n/a | `string` | `""` | no |
| <a name="input_user_data_script"></a> [user\_data\_script](#input\_user\_data\_script) | Decide which user-data.sh script to use | `string` | `"user-data-cloud-init.tpl"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_basic_vm_server_dns"></a> [basic\_vm\_server\_dns](#output\_basic\_vm\_server\_dns) | n/a |
| <a name="output_basic_vm_server_id"></a> [basic\_vm\_server\_id](#output\_basic\_vm\_server\_id) | n/a |
| <a name="output_basic_vm_server_nicuuid"></a> [basic\_vm\_server\_nicuuid](#output\_basic\_vm\_server\_nicuuid) | n/a |
| <a name="output_basic_vm_server_public_ip"></a> [basic\_vm\_server\_public\_ip](#output\_basic\_vm\_server\_public\_ip) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.4.14 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_firewall.range_rule](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/firewall) | resource |
| [ionoscloud_firewall.rule](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/firewall) | resource |
| [ionoscloud_ipblock.public_ip](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/ipblock) | resource |
| [ionoscloud_lan.basic_vm_server_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/lan) | resource |
| [ionoscloud_server.basic_vm_server](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/server) | resource |
| [ionoscloud_server.basic_vm_server_not_permanent](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/server) | resource |
| [ionoscloud_volume.second_volume](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/volume) | resource |
| [opentelekomcloud_dns_recordset_v2.a_records](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2) | resource |
| [ionoscloud_datacenter.datacenter](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/data-sources/datacenter) | data source |
| [opentelekomcloud_dns_zone_v2.dns_zone](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/dns_zone_v2) | data source |
<!-- END_TF_DOCS -->