<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.4.18 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datacenter_id"></a> [datacenter_id](#input\_datacenter_id) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_server_id"></a> [server_id](#input\_server_ids) | n/a | `string` | n/a | yes |
| <a name="input_ports"></a> [ports](#input\_ports) | n/a | `list`   | n/a | yes |
| <a name="input_is_public"></a> [is_public](#input\_is_public) | n/a | `bool`   | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lan_id"></a> [lan_id](lan\_id) | n/a |
| <a name="output_nic_id"></a> [nic_id](nic\_id) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.4.18 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_firewall.range_rule](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/firewall) | resource |
| [ionoscloud_firewall.rule](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/firewall) | resource |
| [ionoscloud_ipblock.public_ip](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/ipblock) | resource |
| [ionoscloud_lan.basic_vm_server_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/lan) | resource |

<!-- END_TF_DOCS -->