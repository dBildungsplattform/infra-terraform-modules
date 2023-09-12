<!-- BEGIN_TF_DOCS -->

## Providers

No providers.
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | The coordinates for the generated infrastructure, employed for identifying structural elements | `map(any)` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | domain without top level | `string` | n/a | yes |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | define top level domains | `map(any)` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_dns"></a> [cluster\_dns](#output\_cluster\_dns) | <project><-stage><-scope><-index>.xxxxx.<de\|org\|dev> |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_datacenter_name"></a> [datacenter\_name](#output\_datacenter\_name) | n/a |
| <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name) | n/a |
| <a name="output_global_identifier"></a> [global\_identifier](#output\_global\_identifier) | <project><-stage><-scope><-index> |
| <a name="output_top_level_domain"></a> [top\_level\_domain](#output\_top\_level\_domain) | n/a |
## Requirements

No requirements.
## Resources

No resources.
<!-- END_TF_DOCS -->