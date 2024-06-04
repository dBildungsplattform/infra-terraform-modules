<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.3.6 |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datacenter_name"></a> [datacenter\_name](#input\_datacenter\_name) | n/a | `string` | n/a | yes |
| <a name="input_associated_backend_crossconnect_id"></a> [associated\_backend\_crossconnect\_id](#input\_associated\_backend\_crossconnect\_id) | Specifies whether an existing crossconnect shall be associated. | `string` | `""` | no |
| <a name="input_associated_frontend_crossconnect_id"></a> [associated\_frontend\_crossconnect\_id](#input\_associated\_frontend\_crossconnect\_id) | Specifies whether an existing crossconnect shall be associated. | `string` | `""` | no |
| <a name="input_associated_service_crossconnect_id"></a> [associated\_service\_crossconnect\_id](#input\_associated\_service\_crossconnect\_id) | Specifies whether an existing crossconnect shall be associated. | `string` | `""` | no |
| <a name="input_create_alb_target_lan"></a> [create\_alb\_target\_lan](#input\_create\_alb\_target\_lan) | Specifies whether a private target for the Application Load Balancer shall be created. | `bool` | `false` | no |
| <a name="input_create_backend_crossconnect"></a> [create\_backend\_crossconnect](#input\_create\_backend\_crossconnect) | Specifies whether crossconnect shall be created. Default: false. | `bool` | `false` | no |
| <a name="input_create_frontend_crossconnect"></a> [create\_frontend\_crossconnect](#input\_create\_frontend\_crossconnect) | Specifies whether crossconnect shall be created. Default: false. | `bool` | `false` | no |
| <a name="input_create_nat_lan"></a> [create\_nat\_lan](#input\_create\_nat\_lan) | Specifies whether a private lan to connect a NAT gateway shall be created. | `bool` | `false` | no |
| <a name="input_create_nfs_server_lan"></a> [create\_nfs\_server\_lan](#input\_create\_nfs\_server\_lan) | Specifies whether a private lan to connect an NFS server shall be created. | `bool` | `false` | no |
| <a name="input_create_nlb_target_lan"></a> [create\_nlb\_target\_lan](#input\_create\_nlb\_target\_lan) | Specifies whether a private target for the Network Load Balancer shall be created. | `bool` | `false` | no |
| <a name="input_create_postgres_lan"></a> [create\_postgres\_lan](#input\_create\_postgres\_lan) | Specifies whether a private lan to connect Postgres shall be created. | `bool` | `false` | no |
| <a name="input_create_public_lan"></a> [create\_public\_lan](#input\_create\_public\_lan) | Specifies whether a public lan shall be created. Default: false. | `bool` | `false` | no |
| <a name="input_create_service_crossconnect"></a> [create\_service\_crossconnect](#input\_create\_service\_crossconnect) | Specifies whether crossconnect shall be created. Default: false. | `bool` | `false` | no |
| <a name="input_crossconnect_shared_group_ids"></a> [crossconnect\_shared\_group\_ids](#input\_crossconnect\_shared\_group\_ids) | Specifies which groups crossconnect shall be shared with. Default: []. | `list(string)` | `[]` | no |
| <a name="input_custom_lans_to_create"></a> [custom\_lans\_to\_create](#input\_custom\_lans\_to\_create) | Map of for private LANs to be created. The key is used for the output. The value is used for the name: <datacenter name>-<value> | `map(string)` | `{}` | no |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | n/a | `string` | `"de/txl"` | no |
| <a name="input_datacenter_shares"></a> [datacenter\_shares](#input\_datacenter\_shares) | Which groups have access to the datacenter | <pre>list(object({<br>    group  = string<br>    edit   = optional(bool, false)<br>    share  = optional(bool, false)<br>  }))</pre> | `[]` | no |
| <a name="input_routes_map"></a> [routes\_map](#input\_routes\_map) | map which links based on the lan id to a list in which the routes in form of an object ('network'='###' and 'gateway\_ip'='###') are saved | `any` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_target_lan_id"></a> [alb\_target\_lan\_id](#output\_alb\_target\_lan\_id) | n/a |
| <a name="output_backend_crossconnect_id"></a> [backend\_crossconnect\_id](#output\_backend\_crossconnect\_id) | n/a |
| <a name="output_custom_lans_id"></a> [custom\_lans\_id](#output\_custom\_lans\_id) | n/a |
| <a name="output_datacenter_id"></a> [datacenter\_id](#output\_datacenter\_id) | n/a |
| <a name="output_datacenter_location"></a> [datacenter\_location](#output\_datacenter\_location) | n/a |
| <a name="output_datacenter_name"></a> [datacenter\_name](#output\_datacenter\_name) | n/a |
| <a name="output_frontend_crossconnect_id"></a> [frontend\_crossconnect\_id](#output\_frontend\_crossconnect\_id) | n/a |
| <a name="output_frontend_lan_id"></a> [frontend\_lan\_id](#output\_frontend\_lan\_id) | n/a |
| <a name="output_lan_alb_target"></a> [lan\_alb\_target](#output\_lan\_alb\_target) | n/a |
| <a name="output_lan_backend"></a> [lan\_backend](#output\_lan\_backend) | n/a |
| <a name="output_lan_frontend"></a> [lan\_frontend](#output\_lan\_frontend) | n/a |
| <a name="output_lan_nat"></a> [lan\_nat](#output\_lan\_nat) | n/a |
| <a name="output_lan_nfs_server"></a> [lan\_nfs\_server](#output\_lan\_nfs\_server) | n/a |
| <a name="output_lan_nlb_target"></a> [lan\_nlb\_target](#output\_lan\_nlb\_target) | n/a |
| <a name="output_lan_postgres"></a> [lan\_postgres](#output\_lan\_postgres) | n/a |
| <a name="output_lan_service"></a> [lan\_service](#output\_lan\_service) | n/a |
| <a name="output_lans_custom"></a> [lans\_custom](#output\_lans\_custom) | n/a |
| <a name="output_nat_lan_id"></a> [nat\_lan\_id](#output\_nat\_lan\_id) | n/a |
| <a name="output_nfs_server_lan_id"></a> [nfs\_server\_lan\_id](#output\_nfs\_server\_lan\_id) | n/a |
| <a name="output_nlb_target_lan_id"></a> [nlb\_target\_lan\_id](#output\_nlb\_target\_lan\_id) | n/a |
| <a name="output_postgres_lan_id"></a> [postgres\_lan\_id](#output\_postgres\_lan\_id) | n/a |
| <a name="output_service_crossconnect_id"></a> [service\_crossconnect\_id](#output\_service\_crossconnect\_id) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.3.6 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_datacenter.datacenter](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/datacenter) | resource |
| [ionoscloud_lan.alb_target_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.backend_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.custom_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.frontend_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.nat_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.nfs_server_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.nlb_target_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.postgres_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.public_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_lan.service_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_private_crossconnect.backend_cc](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/private_crossconnect) | resource |
| [ionoscloud_private_crossconnect.frontend_cc](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/private_crossconnect) | resource |
| [ionoscloud_private_crossconnect.service_cc](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/private_crossconnect) | resource |
| [ionoscloud_share.backend_cc](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/share) | resource |
| [ionoscloud_share.datacenter_permissions](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/share) | resource |
| [ionoscloud_share.frontend_cc](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/share) | resource |
| [ionoscloud_share.service_cc](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/share) | resource |
<!-- END_TF_DOCS -->