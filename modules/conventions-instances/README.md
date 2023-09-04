<!-- BEGIN_TF_DOCS -->

## Providers

No providers.
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | The top level domain | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | The domain, without top level | `string` | `"<domain>"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | represent the stage environment, such as 'prod', 'staging', or 'dev' | `string` | `"dev"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stage_in_url"></a> [stage\_in\_url](#output\_stage\_in\_url) | ## - output --------------------------------- |
## Requirements

No requirements.
## Resources

No resources.
<!-- END_TF_DOCS -->