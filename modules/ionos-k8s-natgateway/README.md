<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.4.18 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cidr_workaround"></a> [cidr\_workaround](#module\_cidr\_workaround) | ../../modules/ionos-cidr-workaround | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | n/a | `string` | n/a | yes |
| <a name="input_k8s_cluster_id"></a> [k8s\_cluster\_id](#input\_k8s\_cluster\_id) | n/a | `string` | n/a | yes |
| <a name="input_lan_id"></a> [lan\_id](#input\_lan\_id) | The LAN to connect the NAT gateway to. | `string` | n/a | yes |
| <a name="input_natgateway_name"></a> [natgateway\_name](#input\_natgateway\_name) | n/a | `string` | n/a | yes |
| <a name="input_natgateway_rule_name"></a> [natgateway\_rule\_name](#input\_natgateway\_rule\_name) | n/a | `string` | n/a | yes |
| <a name="input_create_ipblock"></a> [create\_ipblock](#input\_create\_ipblock) | Specifies whether an ipblock should be created. Default: false. | `bool` | `false` | no |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | n/a | `string` | `null` | no |
| <a name="input_ipblock_name"></a> [ipblock\_name](#input\_ipblock\_name) | n/a | `string` | `null` | no |
| <a name="input_ipblock_size"></a> [ipblock\_size](#input\_ipblock\_size) | n/a | `number` | `null` | no |
| <a name="input_natgateway_host_num"></a> [natgateway\_host\_num](#input\_natgateway\_host\_num) | The number to be set in the last ip block. Default: 8. | `number` | `8` | no |
| <a name="input_natgateway_public_ips"></a> [natgateway\_public\_ips](#input\_natgateway\_public\_ips) | Specifies the list of public ips of the NAT gateway. | `list(string)` | `null` | no |
| <a name="input_natgateway_rule_protocol"></a> [natgateway\_rule\_protocol](#input\_natgateway\_rule\_protocol) | Specifies the protocol of the NAT gateway rule. Default: ALL. | `string` | `"ALL"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_natgateway_id"></a> [natgateway\_id](#output\_natgateway\_id) | n/a |
| <a name="output_public_ips"></a> [public\_ips](#output\_public\_ips) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.4.18 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_ipblock.natgateway](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/ipblock) | resource |
| [ionoscloud_natgateway.natgateway](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/natgateway) | resource |
| [ionoscloud_natgateway_rule.natgateway_rule](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/natgateway_rule) | resource |
<!-- END_TF_DOCS -->