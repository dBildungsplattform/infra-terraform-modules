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
| <a name="input_k8s_cluster_id"></a> [k8s\_cluster\_id](#input\_k8s\_cluster\_id) | UUID of the Kubernetes cluster that the LAN is in | `string` | n/a | yes |
| <a name="input_lan_id"></a> [lan\_id](#input\_lan\_id) | ID of the LAN whose IP we want to get | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nicIndex"></a> [nicIndex](#output\_nicIndex) | n/a |
| <a name="output_prefix"></a> [prefix](#output\_prefix) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.3.6 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_k8s_cluster.k8s_cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/data-sources/k8s_cluster) | data source |
| [ionoscloud_k8s_node_pool.k8s_node_pool](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/data-sources/k8s_node_pool) | data source |
| [ionoscloud_servers.k8s_node](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/data-sources/servers) | data source |
| [ionoscloud_servers.k8s_nodes](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.3.6/docs/data-sources/servers) | data source |
<!-- END_TF_DOCS -->