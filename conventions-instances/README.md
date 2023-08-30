# Usage

<!--- BEGIN_TF_DOCS --->

## Providers

No providers.
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | The top level domain. | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | The domain, without top level. E.g. "hpi-schul-cloud" | `string` | `"<domain>"` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | service="scecho", instance\_id="feature-ops-2350", instance\_location="marbarte" Instance location is optional.  https://docs.hpi-schul-cloud.org/display/PROD/Infrastructure+Conventions+Schul-Cloud | `map(any)` | <pre>{<br>  "instance_id": "<instance_id>",<br>  "instance_location": "<instance_location>",<br>  "service": "<service>"<br>}</pre> | no |
| <a name="input_stage"></a> [stage](#input\_stage) |  | `string` | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance"></a> [instance](#output\_instance) | [<instance\_id>-]<instance\_location>  Examples: service: echo1, stage: "", instance\_id: feature-ops-2360, instance\_location: marbarte, domain: hpi-schul-cloud.org feature-ops-2360-marbarte  instance\_id: feature-ops-2360, instance\_location: niedersachsen feature-ops-2360-niedersachsen |
| <a name="output_internal_alias_dns"></a> [internal\_alias\_dns](#output\_internal\_alias\_dns) | [<service>.][<stage>.][<instance\_id>.]<instance\_location>.<domain>  Examples: service: echo1, stage: "", instance\_id: feature-ops-2360, instance\_location: marbarte, domain: hpi-schul-cloud.org echo1.feature-ops-2360.marbarte.hpi-schul-cloud.org  service: storage, stage: staging, instance\_id: "", instance\_location: niedersachsen, domain: hpi-schul-cloud.org storage.staging.niedersachsen.hpi-schul-cloud.org |
| <a name="output_subdomain_level_1"></a> [subdomain\_level\_1](#output\_subdomain\_level\_1) | [<instance\_id>.]<instance\_location>.<domain> |
| <a name="output_subdomain_level_2"></a> [subdomain\_level\_2](#output\_subdomain\_level\_2) | [<stage>.][<instance\_id>.]<instance\_location>.<domain> |
## Requirements

No requirements.
## Resources

No resources.

<!--- END_TF_DOCS --->

