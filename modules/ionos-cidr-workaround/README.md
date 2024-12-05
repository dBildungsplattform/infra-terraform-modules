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
| <a name="input_k8s_cluster_id"></a> [k8s\_cluster\_id](#input\_k8s\_cluster\_id) | UUID of the Kubernetes cluster that the LAN is in | `string` | n/a | yes |
| <a name="input_lan_id"></a> [lan\_id](#input\_lan\_id) | ID of the LAN whose IP we want to get | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nicIndex"></a> [nicIndex](#output\_nicIndex) | Index of the NIC used by the provided LAN in the Kubernetes nodes. |
| <a name="output_node_lan_ips"></a> [node\_lan\_ips](#output\_node\_lan\_ips) | List of the IPs assigned to the currently deployed Kubernetes nodes. When using this keep in mind that some of the IPs will change during maintenance. |
| <a name="output_nodes_full_ip_range"></a> [nodes\_full\_ip\_range](#output\_nodes\_full\_ip\_range) | List of all the IPs in the range used by the Kubernetes cluster (IPs 10 to 255 in the prefix CIDR block). |
| <a name="output_prefix"></a> [prefix](#output\_prefix) | CIDR block used by the Kubernetes cluster, for example '10.0.0.0/24'. |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | ~>6.4 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_k8s_cluster.k8s_cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/data-sources/k8s_cluster) | data source |
| [ionoscloud_k8s_node_pool.k8s_node_pool](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/data-sources/k8s_node_pool) | data source |
| [ionoscloud_servers.k8s_node](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/data-sources/servers) | data source |
| [ionoscloud_servers.k8s_nodes](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/data-sources/servers) | data source |
<!-- END_TF_DOCS -->