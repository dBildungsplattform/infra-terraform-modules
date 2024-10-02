<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.4.18 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_conventions_coordinates"></a> [conventions\_coordinates](#module\_conventions\_coordinates) | ../../modules/conventions-coordinates | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | n/a | `map(any)` | n/a | yes |
| <a name="input_crossconnects_nlb"></a> [crossconnects\_nlb](#input\_crossconnects\_nlb) | A map of all crossconnects containing (multiple) <crossconnectsname>: <nlb listener ip> | `map(string)` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | ID of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | Location of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_datacenter_name"></a> [datacenter\_name](#input\_datacenter\_name) | Name of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | Domain without top level | `string` | n/a | yes |
| <a name="input_nlb_listener_port"></a> [nlb\_listener\_port](#input\_nlb\_listener\_port) | Listening (inbound) port number | `number` | n/a | yes |
| <a name="input_nlb_target_lan_id"></a> [nlb\_target\_lan\_id](#input\_nlb\_target\_lan\_id) | The LAN to connect your Network Loadbalancer to | `string` | n/a | yes |
| <a name="input_nlb_target_port"></a> [nlb\_target\_port](#input\_nlb\_target\_port) | The port of the balanced target service; valid range is 1 to 65535 used in target group | `string` | n/a | yes |
| <a name="input_node_nlb_lan_ips"></a> [node\_nlb\_lan\_ips](#input\_node\_nlb\_lan\_ips) | List of node and network loadbalancer lan ips | `list(any)` | n/a | yes |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | Top-level domain mapping for environments | `map(any)` | n/a | yes |
| <a name="input_nlb_target_health_check_timeout"></a> [nlb\_target\_health\_check\_timeout](#input\_nlb\_target\_health\_check\_timeout) | The maximum time in milliseconds to wait for the client to acknowledge or send data | `string` | `6000` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_node_ip_range"></a> [cluster\_node\_ip\_range](#output\_cluster\_node\_ip\_range) | n/a |
| <a name="output_service_cluster_node_ips"></a> [service\_cluster\_node\_ips](#output\_service\_cluster\_node\_ips) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.4.18 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_lan.crossconnect_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/lan) | resource |
| [ionoscloud_networkloadbalancer.nlb](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/networkloadbalancer) | resource |
| [ionoscloud_networkloadbalancer_forwardingrule.forward_k8](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/networkloadbalancer_forwardingrule) | resource |
| [ionoscloud_private_crossconnect.crossconnect](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/data-sources/private_crossconnect) | data source |
<!-- END_TF_DOCS -->