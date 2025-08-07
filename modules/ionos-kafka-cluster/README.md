<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | ~>6.4 |
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
| <a name="output_kafka_cluster_id"></a> [kafka\_cluster\_id](#output\_kafka\_cluster\_id) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | ~>6.4 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_kafka_cluster.kafka_cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/kafka_cluster) | resource |
<!-- END_TF_DOCS -->