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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes cluster name | `string` | n/a | yes |
| <a name="input_core_count"></a> [core\_count](#input\_core\_count) | This value overwrites pre-defined environment specific k8s cluster sizing | `number` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | ID of datacenter cluster shall be created in | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | n/a | `string` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | This value overwrites specific k8s cluster sizing | `number` | n/a | yes |
| <a name="input_ram_size"></a> [ram\_size](#input\_ram\_size) | This value overwrites pre-defined environment specific k8s cluster sizing | `number` | n/a | yes |
| <a name="input_allow_node_pool_replacement"></a> [allow\_node\_pool\_replacement](#input\_allow\_node\_pool\_replacement) | When set to true, allows the update of immutable fields by first destroying and then re-creating the node pool. | `bool` | `false` | no |
| <a name="input_api_subnet_allow_list"></a> [api\_subnet\_allow\_list](#input\_api\_subnet\_allow\_list) | n/a | `list(string)` | `null` | no |
| <a name="input_associated_lans"></a> [associated\_lans](#input\_associated\_lans) | The lans as objects in a list [{lan[0] with id and routes\_list, lan[1] with id and routes\_list}, ...] | <pre>list(object({<br>    id          = number<br>    routes_list = list(any)<br>  }))</pre> | `[]` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Not needed anymore, we work with a list of zones now | `string` | `"ZONE_1"` | no |
| <a name="input_cpu_family"></a> [cpu\_family](#input\_cpu\_family) | Valid cpu family | `string` | `"INTEL_SKYLAKE"` | no |
| <a name="input_create_public_ip_pools"></a> [create\_public\_ip\_pools](#input\_create\_public\_ip\_pools) | n/a | `bool` | `false` | no |
| <a name="input_custom_nodepools"></a> [custom\_nodepools](#input\_custom\_nodepools) | This object describes nodepool configurations for dynamic creation of nodepools with a specific purpose and resources. | <pre>list(object({<br>    name          = string<br>    auto_scaling  = optional(bool, false)<br>    node_count = number<br>    nodepool_per_zone_count = number<br>    min_node_count= optional(number, null)<br>    max_node_count= optional(number, null)<br>    ram_size      = number<br>    core_count    = number<br>    purpose       = string<br>    availability_zones = list(string)<br>    allow_node_pool_replacement = bool<br>    associated_lans = list(object({<br>      id          = number<br>      routes_list = list(any)<br>    }))<br>    maintenance_day = string<br>    maintenance_hour = number<br>    storage_type = string<br>    storage_size = number<br>    cpu_family = string<br>    create_public_ip_pools = bool<br>    public_ips = map(list(list(string)))<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "allow_node_pool_replacement": null,<br>    "associated_lans": null,<br>    "auto_scaling": false,<br>    "availability_zones": [<br>      "ZONE_1",<br>      "ZONE_2"<br>    ],<br>    "core_count": null,<br>    "cpu_family": null,<br>    "create_public_ip_pools": null,<br>    "maintenance_day": null,<br>    "maintenance_hour": null,<br>    "max_node_count": null,<br>    "min_node_count": null,<br>    "name": "Legacy",<br>    "node_count": null,<br>    "nodepool_per_zone_count": null,<br>    "public_ips": {<br>      "ZONE_1": [<br>        [<br>          ""<br>        ]<br>      ],<br>      "ZONE_2": [<br>        [<br>          ""<br>        ]<br>      ]<br>    },<br>    "purpose": "legacy",<br>    "ram_size": null,<br>    "storage_size": null,<br>    "storage_type": null<br>  }<br>]</pre> | no |
| <a name="input_enable_legacy_and_scaling"></a> [enable\_legacy\_and\_scaling](#input\_enable\_legacy\_and\_scaling) | Determins if both should be used, otherwise only one will be used where custom\_nodepools overwrite legacy ones | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Kubernetes version | `string` | `"1.24.15"` | no |
| <a name="input_maintenance_day"></a> [maintenance\_day](#input\_maintenance\_day) | On which day to do the maintenance | `string` | `"Saturday"` | no |
| <a name="input_maintenance_hour"></a> [maintenance\_hour](#input\_maintenance\_hour) | On which hour to do the maintenance | `number` | `3` | no |
| <a name="input_nodepool_per_zone_count"></a> [nodepool\_per\_zone\_count](#input\_nodepool\_per\_zone\_count) | n/a | `number` | `0` | no |
| <a name="input_public_ip_pool_zone1"></a> [public\_ip\_pool\_zone1](#input\_public\_ip\_pool\_zone1) | n/a | `list(list(string))` | `null` | no |
| <a name="input_public_ip_pool_zone2"></a> [public\_ip\_pool\_zone2](#input\_public\_ip\_pool\_zone2) | n/a | `list(list(string))` | `null` | no |
| <a name="input_storage_size"></a> [storage\_size](#input\_storage\_size) | n/a | `number` | `100` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | n/a | `string` | `"SSD"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_k8s_version"></a> [cluster\_k8s\_version](#output\_cluster\_k8s\_version) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_nodepool_legacy"></a> [nodepool\_legacy](#output\_nodepool\_legacy) | n/a |
| <a name="output_nodepool_zone1_id"></a> [nodepool\_zone1\_id](#output\_nodepool\_zone1\_id) | n/a |
| <a name="output_nodepool_zone1_ips"></a> [nodepool\_zone1\_ips](#output\_nodepool\_zone1\_ips) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.3.6 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_ipblock.ippools](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/ipblock) | resource |
| [ionoscloud_k8s_cluster.cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/k8s_cluster) | resource |
| [ionoscloud_k8s_node_pool.nodepool_legacy](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/k8s_node_pool) | resource |
| [ionoscloud_k8s_node_pool.nodepool_scaling](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/resources/k8s_node_pool) | resource |
<!-- END_TF_DOCS -->