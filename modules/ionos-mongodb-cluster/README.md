<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.4.18 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cidr_workaround"></a> [cidr\_workaround](#module\_cidr\_workaround) | ../../modules/ionos-cidr-workaround | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | The datacenter to connect your cluster to. | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | The physical location where the cluster will be created. This will be where all of your instances live. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Name of the MongoDB Cluster | `string` | n/a | yes |
| <a name="input_instances_count"></a> [instances\_count](#input\_instances\_count) | The total number of instances (1 master, n-1 fallbacks) in the cluster. Options(Business): 1, 3; Options(Enterprise): 3, 5, 7 | `number` | n/a | yes |
| <a name="input_lan_id"></a> [lan\_id](#input\_lan\_id) | The LAN to connect your cluster to. | `string` | n/a | yes |
| <a name="input_mongo_version"></a> [mongo\_version](#input\_mongo\_version) | The MongoDB version of your cluster. | `string` | n/a | yes |
| <a name="input_cores"></a> [cores](#input\_cores) | The number of CPU cores per node (Enterprise only) | `number` | `null` | no |
| <a name="input_ip_block_start"></a> [ip\_block\_start](#input\_ip\_block\_start) | The starting number to be set in the last ip block (Default: 101) | `number` | `101` | no |
| <a name="input_ip_prefix"></a> [ip\_prefix](#input\_ip\_prefix) | Prefix for the used IPs (e.g. 10.0.4.1/24, required if k8s\_cluster\_id is not defined) | `string` | `null` | no |
| <a name="input_k8s_cluster_id"></a> [k8s\_cluster\_id](#input\_k8s\_cluster\_id) | ID of the kubernetes cluster to connect to. (Used to generate matching IPs, alternativly you can set ip\_prefix directly) | `string` | `null` | no |
| <a name="input_maintenance_day"></a> [maintenance\_day](#input\_maintenance\_day) | The day of the week for the 4 hour-long maintenance window (Default: Sunday) | `string` | `"Sunday"` | no |
| <a name="input_maintenance_hour"></a> [maintenance\_hour](#input\_maintenance\_hour) | The time of the day when the 4 hour-long maintenance window may start. (Default: 3) | `number` | `3` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory in megabytes per node (Enterprise only) | `number` | `null` | no |
| <a name="input_resource_template"></a> [resource\_template](#input\_resource\_template) | Name of the IONOS Template to use for resources (except for Enterprise) | `string` | `null` | no |
| <a name="input_shards_count"></a> [shards\_count](#input\_shards\_count) | Number of MongoDB shards (Enterprise only) | `number` | `null` | no |
| <a name="input_subnet_mask"></a> [subnet\_mask](#input\_subnet\_mask) | The subnet mask to use for allowing connections from the LAN (Default: 24) | `string` | `24` | no |
| <a name="input_users"></a> [users](#input\_users) | Map of users and their roles. Example: {admin: {password: "1234", roles: [{db: "admin", role: "dbAdminAnyDatabase"}]}} | <pre>map(<br>                  object({<br>                    password=string,<br>                    roles=set(<br>                      object({<br>                        db=string,<br>                        role=string<br>                }))}))</pre> | `{}` | no |
| <a name="input_volume_disk_type"></a> [volume\_disk\_type](#input\_volume\_disk\_type) | The storage type used in your cluster (Enterprise only) | `string` | `null` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The amount of storage in MB per node (Enterprise only) | `number` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The URL pointing to your cluster. |
| <a name="output_uuid"></a> [uuid](#output\_uuid) | The UUID of the cluster. |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.4.18 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_mongo_cluster.mongo_cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/mongo_cluster) | resource |
| [ionoscloud_mongo_user.initial_mongo_user](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/resources/mongo_user) | resource |
| [ionoscloud_mongo_template.mongo_template](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.18/docs/data-sources/mongo_template) | data source |
<!-- END_TF_DOCS -->