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
| <a name="module_conventions_coordinates"></a> [conventions\_coordinates](#module\_conventions\_coordinates) | ../sc-conventions-coordinates | n/a |
| <a name="module_conventions_instances"></a> [conventions\_instances](#module\_conventions\_instances) | ../sc-conventions-instances | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | The coordinates of the created infrastructure. Used to identify infrastructural pieces distributed over several services or locations that belong together.  Examples: project=sc, stage=prod, scope=legacy, index="" > sc-prod-legacy project=playground, stage=dev, scope=marbarte, index=01 > playground-dev-marbarte-01 | `map(any)` | <pre>{<br>  "index": "<index_ingress>",<br>  "project": "<project_ingress>",<br>  "scope": "<scope_ingress>",<br>  "stage": "<stage_ingress>"<br>}</pre> | no |
| <a name="input_dns_a_entry"></a> [dns\_a\_entry](#input\_dns\_a\_entry) | The dns A entry this CNAME will point to. | `string` | `""` | no |
| <a name="input_dns_aliases"></a> [dns\_aliases](#input\_dns\_aliases) | Extra aliases | `list(string)` | `[]` | no |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | The domain, without top level. E.g. "hpi-schul-cloud" | `string` | `"<domain_ingress>"` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | service="scecho", instance\_id="feature\_OPS\_2350", instance\_location="marbarte" | `map(any)` | <pre>{<br>  "instance_id": "<instance_id>",<br>  "instance_location": "<instance_location>",<br>  "service": "<service>"<br>}</pre> | no |
## Outputs

| Name | Description |
|------|-------------|
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

