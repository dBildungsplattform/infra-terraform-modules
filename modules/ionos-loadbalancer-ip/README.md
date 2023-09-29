<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.3.6 |
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider\_opentelekomcloud) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_conventions"></a> [conventions](#module\_conventions) | ../../modules/conventions-coordinates | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | n/a | `map(any)` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | Location of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | domain without top level | `string` | n/a | yes |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | Top-level domain mapping for environments | `map(any)` | n/a | yes |
| <a name="input_ingress_mode"></a> [ingress\_mode](#input\_ingress\_mode) | Set to one of 'sclb' or 'nodeport'. | `string` | `"sclb"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_loadbalancer_dns"></a> [loadbalancer\_dns](#output\_loadbalancer\_dns) | n/a |
| <a name="output_loadbalancer_ip"></a> [loadbalancer\_ip](#output\_loadbalancer\_ip) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.3.6 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_ipblock.crip](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/ipblock) | resource |
| [opentelekomcloud_dns_recordset_v2.dnsentry](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2) | resource |
| [time_sleep.crip_destroy_wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [opentelekomcloud_dns_zone_v2.dns_zone](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/dns_zone_v2) | data source |
<!-- END_TF_DOCS -->