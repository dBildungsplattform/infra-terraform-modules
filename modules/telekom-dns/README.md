# Usage

<!--- BEGIN_TF_DOCS --->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider\_opentelekomcloud) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_conventions_coordinates"></a> [conventions\_coordinates](#module\_conventions\_coordinates) | ../conventions-coordinates | n/a |
| <a name="module_conventions_instances"></a> [conventions\_instances](#module\_conventions\_instances) | ../conventions-instances | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | n/a | `map(any)` | <pre>{<br>  "index": "<index_ingress>",<br>  "project": "<project_ingress>",<br>  "scope": "<scope_ingress>",<br>  "stage": "<stage_ingress>"<br>}</pre> | no |
| <a name="input_dns_a_entry"></a> [dns\_a\_entry](#input\_dns\_a\_entry) | The dns A entry this CNAME will point to. | `string` | `""` | no |
| <a name="input_dns_aliases"></a> [dns\_aliases](#input\_dns\_aliases) | Extra aliases | `list(string)` | `[]` | no |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | The domain, without top level | `string` | `"dBildungsplattform"` | no |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | Top-level domain mapping for environments | `map(string)` | <pre>{<br>  "dev": "de",<br>  "prod": "de",<br>  "staging": "de",<br>  "test": "de"<br>}</pre> | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_a_entry"></a> [dns\_a\_entry](#output\_dns\_a\_entry) | dns\_a\_entry Example: dBildungsplattform.de. |
| <a name="output_service_dns"></a> [service\_dns](#output\_service\_dns) | The registered dns CNAME for the service. |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
## Resources

| Name | Type |
|------|------|
| [opentelekomcloud_dns_recordset_v2.dnsaliases](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2) | resource |
| [opentelekomcloud_dns_recordset_v2.dnsentry](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2) | resource |
| [time_sleep.dnswait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [opentelekomcloud_dns_zone_v2.dns_zone](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/dns_zone_v2) | data source |

<!--- END_TF_DOCS --->

