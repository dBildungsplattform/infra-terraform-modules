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
| <a name="input_cores"></a> [cores](#input\_cores) | The number of CPU cores per instance | `number` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | The datacenter to connect your cluster to. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The friendly name of your cluster | `string` | n/a | yes |
| <a name="input_instances_count"></a> [instances\_count](#input\_instances\_count) | The total number of instances in the cluster (one primary and n-1 secondary) | `number` | n/a | yes |
| <a name="input_k8s_cluster_id"></a> [k8s\_cluster\_id](#input\_k8s\_cluster\_id) | n/a | `string` | n/a | yes |
| <a name="input_lan_id"></a> [lan\_id](#input\_lan\_id) | The LAN to connect your cluster to. | `string` | n/a | yes |
| <a name="input_mariadb_version"></a> [mariadb\_version](#input\_mariadb\_version) | The MariaDB version of your cluster | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory per instance in gigabytes (GB) | `number` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | The password for the initial MariaDB user | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | The username for the initial MariaDB user | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The amount of storage per instance in gigabytes (GB) | `number` | n/a | yes |
| <a name="input_ip_block"></a> [ip\_block](#input\_ip\_block) | The number to be set in the last ip block. (Default: 101) | `number` | `101` | no |
| <a name="input_maintenance_day"></a> [maintenance\_day](#input\_maintenance\_day) | The day of the week for the 4 hour-long maintenance window. (Default: Sunday) | `string` | `"Sunday"` | no |
| <a name="input_maintenance_hour"></a> [maintenance\_hour](#input\_maintenance\_hour) | The time of the day when the 4 hour-long maintenance window may start. (Default: 3) | `number` | `3` | no |
| <a name="input_subnet_mask"></a> [subnet\_mask](#input\_subnet\_mask) | The subnet mask to use for allowing connections from the LAN. (Default: 16) | `string` | `16` | no |
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
| [ionoscloud_mariadb_cluster.mariadb_cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/mariadb_cluster) | resource |
<!-- END_TF_DOCS -->