<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.4.18 |
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider\_opentelekomcloud) | n/a |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_conventions"></a> [conventions](#module\_conventions) | ../../modules/conventions-coordinates | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | n/a | `map(any)` | n/a | yes |
| <a name="input_crossconnect_ips"></a> [crossconnect\_ips](#input\_crossconnect\_ips) | List of crossconnect ips which should be assigned to backend haproxy nics | `list(string)` | n/a | yes |
| <a name="input_crossconnects"></a> [crossconnects](#input\_crossconnects) | List of crossconnects which should connect to backend haproxy | `list(string)` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | Id of the datacenter the vm shall be created in | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | Location of the datacenter the vm shall be created in | `string` | n/a | yes |
| <a name="input_datacenter_name"></a> [datacenter\_name](#input\_datacenter\_name) | Name of the datacenter the vm shall be created in | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | domain without top level | `string` | n/a | yes |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | define top level domains | `map(any)` | n/a | yes |
| <a name="input_core_count_overwrite"></a> [core\_count\_overwrite](#input\_core\_count\_overwrite) | This value overwrites pre-defined environment specific vm sizing | `string` | `""` | no |
| <a name="input_cpu_family"></a> [cpu\_family](#input\_cpu\_family) | The CPU family, like INTEL\_SKYLAKE | `string` | `""` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The name of the OS image to use for VMs | `string` | `"centos:7"` | no |
| <a name="input_log_volume_size"></a> [log\_volume\_size](#input\_log\_volume\_size) | The size of the logging volue in gigabytes | `number` | `200` | no |
| <a name="input_ram_size_overwrite"></a> [ram\_size\_overwrite](#input\_ram\_size\_overwrite) | This value overwrites pre-defined environment specific vm sizing | `string` | `""` | no |
| <a name="input_routes_map"></a> [routes\_map](#input\_routes\_map) | map which links based on the lan id to a list in which the routes in form of of an object ('network'='###' and 'gateway\_ip'='###') are saved | `any` | `{}` | no |
| <a name="input_ssh_key_path"></a> [ssh\_key\_path](#input\_ssh\_key\_path) | provide the relative path to and file name from your ssh key | `string` | `"./ssh-key.pub"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_lan"></a> [cluster\_lan](#output\_cluster\_lan) | n/a |
| <a name="output_crossconnect_haproxy_nics"></a> [crossconnect\_haproxy\_nics](#output\_crossconnect\_haproxy\_nics) | n/a |
| <a name="output_server_primary_ip"></a> [server\_primary\_ip](#output\_server\_primary\_ip) | n/a |
| <a name="output_server_public_ip"></a> [server\_public\_ip](#output\_server\_public\_ip) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.4.18 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_firewall.firewallping](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/firewall) | resource |
| [ionoscloud_firewall.firewallssh](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/firewall) | resource |
| [ionoscloud_lan.cluster_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/lan) | resource |
| [ionoscloud_lan.crossconnect_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/lan) | resource |
| [ionoscloud_lan.public_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/lan) | resource |
| [ionoscloud_nic.cluster_nic](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/nic) | resource |
| [ionoscloud_nic.crossconnect_nic](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/nic) | resource |
| [ionoscloud_server.server](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/server) | resource |
| [ionoscloud_private_crossconnect.crossconnect](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/data-sources/private_crossconnect) | data source |
| [opentelekomcloud_dns_zone_v2.dns_zone](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/dns_zone_v2) | data source |
<!-- END_TF_DOCS -->