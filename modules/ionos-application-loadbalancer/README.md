<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.3.6 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_conventions_coordinates"></a> [conventions\_coordinates](#module\_conventions\_coordinates) | ../../modules/conventions-coordinates | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_target_lan_id"></a> [alb\_target\_lan\_id](#input\_alb\_target\_lan\_id) | The LAN to connect your Application Loadbalancer to | `string` | n/a | yes |
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | n/a | `map(any)` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | ID of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | Location of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_datacenter_name"></a> [datacenter\_name](#input\_datacenter\_name) | Name of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | Domain without top level | `string` | n/a | yes |
| <a name="input_node_alb_lan_ips"></a> [node\_alb\_lan\_ips](#input\_node\_alb\_lan\_ips) | List of node and application load balancer lan ips | `list` | n/a | yes |
| <a name="input_ssl_cert_ids"></a> [ssl\_cert\_ids](#input\_ssl\_cert\_ids) | Array of certificate ids. You can create certificates with the certificate resource | `list` | n/a | yes |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | Top-level domain mapping for environments | `map(any)` | n/a | yes |
| <a name="input_alb_client_timeout"></a> [alb\_client\_timeout](#input\_alb\_client\_timeout) | The maximum time in milliseconds to wait for the client to acknowledge or send data; default is 50,000 (50 seconds) | `number` | `6000` | no |
| <a name="input_alb_listener_port"></a> [alb\_listener\_port](#input\_alb\_listener\_port) | Listening (inbound) port number; valid range is 1 to 65535 | `number` | `443` | no |
| <a name="input_alb_target_health_check_timeout"></a> [alb\_target\_health\_check\_timeout](#input\_alb\_target\_health\_check\_timeout) | The maximum time in milliseconds to wait for the client to acknowledge or send data; default is 50,000 (50 seconds) | `string` | `6000` | no |
| <a name="input_alb_target_http_health_check_path"></a> [alb\_target\_http\_health\_check\_path](#input\_alb\_target\_http\_health\_check\_path) | The maximum time in milliseconds to wait for the client to acknowledge or send data; default is 50,000 (50 seconds) | `string` | `"/healthz"` | no |
| <a name="input_alb_target_port"></a> [alb\_target\_port](#input\_alb\_target\_port) | The port of the balanced target service; valid range is 1 to 65535 used in target group | `string` | `30080` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_ip"></a> [alb\_ip](#output\_alb\_ip) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.3.6 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_application_loadbalancer.alb](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/application_loadbalancer) | resource |
| [ionoscloud_application_loadbalancer_forwardingrule.forward_k8s](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/application_loadbalancer_forwardingrule) | resource |
| [ionoscloud_ipblock.alb](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/ipblock) | resource |
| [ionoscloud_lan.alb_listener_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/lan) | resource |
| [ionoscloud_target_group.k8s_node_pools](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/target_group) | resource |
<!-- END_TF_DOCS -->