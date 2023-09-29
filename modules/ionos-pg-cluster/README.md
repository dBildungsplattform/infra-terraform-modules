<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.3.6 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cidr_workaround"></a> [cidr\_workaround](#module\_cidr\_workaround) | ../../modules/ionos-cidr-workaround | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cores"></a> [cores](#input\_cores) | The number of CPU cores per replica. | `number` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | The datacenter to connect your cluster to. | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | The physical location where the cluster will be created. This will be where all of your instances live. | `any` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display Name of an existing cluster that you want to search for. | `string` | n/a | yes |
| <a name="input_instances_count"></a> [instances\_count](#input\_instances\_count) | The total number of instances in the cluster (one master and n-1 standbys) | `number` | n/a | yes |
| <a name="input_k8s_cluster_id"></a> [k8s\_cluster\_id](#input\_k8s\_cluster\_id) | n/a | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory per instance in megabytes. | `number` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | The password for the initial postgres user. | `string` | n/a | yes |
| <a name="input_postgres_lan_id"></a> [postgres\_lan\_id](#input\_postgres\_lan\_id) | The LAN to connect your cluster to. | `string` | n/a | yes |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | The PostgreSQL version of your cluster. | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | The username for the initial postgres user. | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The amount of storage per instance in MB. | `number` | n/a | yes |
| <a name="input_ip_block"></a> [ip\_block](#input\_ip\_block) | The number to be set in the last ip block. (Default: 101) | `number` | `101` | no |
| <a name="input_maintenance_day"></a> [maintenance\_day](#input\_maintenance\_day) | The day of the week for the 4 hour-long maintenance window. (Default: Sunday) | `string` | `"Sunday"` | no |
| <a name="input_maintenance_hour"></a> [maintenance\_hour](#input\_maintenance\_hour) | The time of the day when the 4 hour-long maintenance window may start. (Default: 3) | `number` | `3` | no |
| <a name="input_subnet_mask"></a> [subnet\_mask](#input\_subnet\_mask) | The subnet mask to use for allowing connections from the LAN. (Default: 16) | `string` | `16` | no |
| <a name="input_synchronization_mode"></a> [synchronization\_mode](#input\_synchronization\_mode) | Represents different modes of replication. Can have one of the following values: ASYNCHRONOUS, SYNCHRONOUS, STRICTLY\_SYNCHRONOUS. This attribute is immutable(disallowed in update requests). (Default: ASYNCHRONOUS) | `string` | `"ASYNCHRONOUS"` | no |
| <a name="input_volume_disk_type"></a> [volume\_disk\_type](#input\_volume\_disk\_type) | The storage type used in your cluster. (Default: SSD) | `string` | `"SSD"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name pointing to your cluster. |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.3.6 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_pg_cluster.pg_cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/pg_cluster) | resource |
<!-- END_TF_DOCS -->