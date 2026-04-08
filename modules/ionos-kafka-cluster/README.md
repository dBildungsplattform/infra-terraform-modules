<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | ~>6.7.23 |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_broker_addresses"></a> [broker\_addresses](#input\_broker\_addresses) | IP addresses and subnet of cluster brokers | `list(string)` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | ID of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | Location of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_kafka_cluster_name"></a> [kafka\_cluster\_name](#input\_kafka\_cluster\_name) | Name of the Kafka Cluster | `string` | n/a | yes |
| <a name="input_kafka_lan_id"></a> [kafka\_lan\_id](#input\_kafka\_lan\_id) | ID of the LAN whose IP we want to get | `string` | n/a | yes |
| <a name="input_kafka_cluster_size"></a> [kafka\_cluster\_size](#input\_kafka\_cluster\_size) | Required. Size of the Kafka Cluster. Possible values: 'XS', 'S'.'M','L','XL' | `string` | `null` | no |
| <a name="input_kafka_version"></a> [kafka\_version](#input\_kafka\_version) | Version of the Kafka Cluster. | `string` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kafka_cluster_broker_addresses"></a> [kafka\_cluster\_broker\_addresses](#output\_kafka\_cluster\_broker\_addresses) | n/a |
| <a name="output_kafka_cluster_certificate"></a> [kafka\_cluster\_certificate](#output\_kafka\_cluster\_certificate) | n/a |
| <a name="output_kafka_cluster_certificate_authority"></a> [kafka\_cluster\_certificate\_authority](#output\_kafka\_cluster\_certificate\_authority) | n/a |
| <a name="output_kafka_cluster_id"></a> [kafka\_cluster\_id](#output\_kafka\_cluster\_id) | n/a |
| <a name="output_kafka_cluster_private_key"></a> [kafka\_cluster\_private\_key](#output\_kafka\_cluster\_private\_key) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | ~>6.7.23 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_kafka_cluster.kafka_cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/kafka_cluster) | resource |
| [ionoscloud_kafka_user_credentials.kafka_cluster_user_credentials](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/data-sources/kafka_user_credentials) | data source |
| [ionoscloud_kafka_users.kafka_cluster_users](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/data-sources/kafka_users) | data source |
<!-- END_TF_DOCS -->