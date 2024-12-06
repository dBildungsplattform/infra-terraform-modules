<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | ~>6.4 |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | The Datacenter id | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name given for the module | `string` | n/a | yes |
| <a name="input_ports"></a> [ports](#input\_ports) | List of Ports toprovided to rule | `list` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | The Server id for the lan | `string` | n/a | yes |
| <a name="input_dhcp_enabled"></a> [dhcp\_enabled](#input\_dhcp\_enabled) | The DHCP is used (true) or not (false) | `bool` | `true` | no |
| <a name="input_is_public"></a> [is\_public](#input\_is\_public) | The Type of lan is public (true) or private (false) | `bool` | `false` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lan_id"></a> [lan\_id](#output\_lan\_id) | The id of the lan created |
| <a name="output_nic_id"></a> [nic\_id](#output\_nic\_id) | The id of the nic created |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | ~>6.4 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_firewall.rule](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/firewall) | resource |
| [ionoscloud_lan.lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/lan) | resource |
| [ionoscloud_nic.nic](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/nic) | resource |
<!-- END_TF_DOCS -->