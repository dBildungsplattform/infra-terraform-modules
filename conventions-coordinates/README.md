# Usage

<!--- BEGIN_TF_DOCS --->

## Providers

No providers.
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | The coordinates of the created infrastructure. Used to identify infrastructural pieces distributed over several services or locations that belong together.  Examples: project=sc, stage=prod, scope=legacy, index="" > sc-prod-legacy project=playground, stage=dev, scope=marbarte, index=01 > playground-dev-marbarte-01  https://docs.hpi-schul-cloud.org/display/PROD/Infrastructure+Conventions+Schul-Cloud | `map(any)` | <pre>{<br>  "index": "<index>",<br>  "project": "<project>",<br>  "scope": "<scope>",<br>  "stage": "<stage>"<br>}</pre> | no |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | The domain, without top level. E.g. "hpi-schul-cloud" | `string` | `"<domain>"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_dns"></a> [cluster\_dns](#output\_cluster\_dns) | Cluster URL without protocol. Only the dns part. <project><-stage><-scope><-index>.hpi-schul-cloud.<de\|org\|dev> E.g. "sc-prod-legacy.hpi-schul-cloud.de", "playground-dev-marbarte-1.hpi-schul-cloud.dev" |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the Kubernetes cluster in the IONOS DCD. See: https://docs.hpi-schul-cloud.org/display/PROD/IONOS+Conventions Identical to the global\_identifier. |
| <a name="output_datacenter_name"></a> [datacenter\_name](#output\_datacenter\_name) | The name of the datacenter in the IONOS DCD. See: https://docs.hpi-schul-cloud.org/display/PROD/IONOS+Conventions Identical to the global\_identifier. |
| <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name) | An identifier that can be used to get the dns zone as data source by name. https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/dns_zone_v2 E.g. "hpi-schul-cloud.de" |
| <a name="output_global_identifier"></a> [global\_identifier](#output\_global\_identifier) | <project><-stage><-scope><-index>  Example: sc-prod-legacy, playground-dev-marbarte-01  This is the most commonly used identifier for resource names in the IONOS DCD. |
| <a name="output_top_level_domain"></a> [top\_level\_domain](#output\_top\_level\_domain) | The top level domain calculated from the selected terraform workspace. |
## Requirements

No requirements.
## Resources

No resources.

<!--- END_TF_DOCS --->

