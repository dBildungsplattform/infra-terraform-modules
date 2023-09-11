<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.3.6 |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes cluster name. | `string` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | ID of datacenter cluster shall be created in. | `string` | n/a | yes |
| <a name="input_api_subnet_allow_list"></a> [api\_subnet\_allow\_list](#input\_api\_subnet\_allow\_list) | Restrict access to the K8s API server to these IP(Range)s | `list(string)` | `null` | no |
| <a name="input_associated_lans"></a> [associated\_lans](#input\_associated\_lans) | The lans as objects in a list [{lan[0] with id and routes\_list, lan[1] with id and routes\_list}, ...] | <pre>list(object({<br>    id             = number<br>    routes_list    = list(any)<br>  }))</pre> | `[]` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The desired Compute availability zone | `string` | `"ZONE_1"` | no |
| <a name="input_core_count"></a> [core\_count](#input\_core\_count) | This value overwrites pre-defined environment specific k8s cluster sizing. | `number` | `null` | no |
| <a name="input_cpu_family"></a> [cpu\_family](#input\_cpu\_family) | Valid cpu family | `string` | `"INTEL_SKYLAKE"` | no |
| <a name="input_create_public_ip_pools"></a> [create\_public\_ip\_pools](#input\_create\_public\_ip\_pools) | Nodepool Automatically create an IP pool per node pool with node count + 1 ips | `bool` | `false` | no |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | Via the datacenter location the available CPU type is controlled. The actual location is already is already fixed, because the datacenter\_id is used. | `string` | `"de/txt"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Kubernetes version. | `string` | `"1.24.15"` | no |
| <a name="input_maintenance_day"></a> [maintenance\_day](#input\_maintenance\_day) | On which day to do the maintenance | `string` | `"Saturday"` | no |
| <a name="input_maintenance_hour"></a> [maintenance\_hour](#input\_maintenance\_hour) | On which hour to do the maintenance | `number` | `3` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | This value overwrites pre-defined environment specific k8s cluster sizing. | `number` | `1` | no |
| <a name="input_nodepool_per_zone_count"></a> [nodepool\_per\_zone\_count](#input\_nodepool\_per\_zone\_count) | The desired number of nodes | `number` | `0` | no |
| <a name="input_public_ip_pool_zone1"></a> [public\_ip\_pool\_zone1](#input\_public\_ip\_pool\_zone1) | Nodepool Public ips zone1. For each nodepool a list of assigned ips can be defined. The number of ips must be one more than the desired node count per node pool. | `list(list(string))` | `null` | no |
| <a name="input_public_ip_pool_zone2"></a> [public\_ip\_pool\_zone2](#input\_public\_ip\_pool\_zone2) | Nodepool Public ips zone2. For each nodepool a list of assigned ips can be defined. The number of ips must be one more than the desired node count per node pool. | `list(list(string))` | `null` | no |
| <a name="input_ram_size"></a> [ram\_size](#input\_ram\_size) | This value overwrites pre-defined environment specific k8s cluster sizing. | `number` | `8192` | no |
| <a name="input_storage_size"></a> [storage\_size](#input\_storage\_size) | The size of the volume in GB. The size should be greater than 10GB. This attribute is immutable. | `number` | `100` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The desired storage type - SSD/HDD. This attribute is immutable. | `string` | `"SSD"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | A cluster UUID |
| <a name="output_cluster_k8s_version"></a> [cluster\_k8s\_version](#output\_cluster\_k8s\_version) | The desired Kubernetes Version |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the cluster that shall be created. |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.3.6 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_ipblock.ippools_zone1](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/ipblock) | resource |
| [ionoscloud_ipblock.ippools_zone2](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/ipblock) | resource |
| [ionoscloud_k8s_cluster.cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/k8s_cluster) | resource |
| [ionoscloud_k8s_node_pool.nodepool_zone1](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/k8s_node_pool) | resource |
| [ionoscloud_k8s_node_pool.nodepool_zone2](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/k8s_node_pool) | resource |
<!-- END_TF_DOCS -->