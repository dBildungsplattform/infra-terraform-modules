<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ionoscloud"></a> [ionoscloud](#provider\_ionoscloud) | 6.4.14 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_basic-vm"></a> [basic-vm](#module\_basic-vm) | ../../modules/ionos-basic-vm | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basic_vm_second_volume_disk_type"></a> [basic\_vm\_second\_volume\_disk\_type](#input\_basic\_vm\_second\_volume\_disk\_type) | Disk type of the second volume | `string` | n/a | yes |
| <a name="input_basic_vm_second_volume_size"></a> [basic\_vm\_second\_volume\_size](#input\_basic\_vm\_second\_volume\_size) | Size of the second volume in GB | `number` | n/a | yes |
| <a name="input_basic_vm_server_cpu"></a> [basic\_vm\_server\_cpu](#input\_basic\_vm\_server\_cpu) | CPU cores allocated to the VM | `number` | n/a | yes |
| <a name="input_basic_vm_server_memory"></a> [basic\_vm\_server\_memory](#input\_basic\_vm\_server\_memory) | Memory allocated to the VM | `number` | n/a | yes |
| <a name="input_basic_vm_volume_size"></a> [basic\_vm\_volume\_size](#input\_basic\_vm\_volume\_size) | Size of the primary volume in GB | `number` | n/a | yes |
| <a name="input_coordinates"></a> [coordinates](#input\_coordinates) | n/a | `map(any)` | n/a | yes |
| <a name="input_cores"></a> [cores](#input\_cores) | Number of CPU cores per MariaDB instance | `number` | n/a | yes |
| <a name="input_cpu_family"></a> [cpu\_family](#input\_cpu\_family) | Type of CPU to use | `string` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | n/a | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | Geographic location of the datacenter | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name for the MariaDB cluster | `string` | n/a | yes |
| <a name="input_domain_without_top_level"></a> [domain\_without\_top\_level](#input\_domain\_without\_top\_level) | domain without top level | `string` | n/a | yes |
| <a name="input_fulldomainname"></a> [fulldomainname](#input\_fulldomainname) | Domain under which the basic VM server will be available | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | Image UUID for the VM | `string` | n/a | yes |
| <a name="input_instances_count"></a> [instances\_count](#input\_instances\_count) | Number of instances in the MariaDB cluster | `number` | n/a | yes |
| <a name="input_ip_pool_name"></a> [ip\_pool\_name](#input\_ip\_pool\_name) | Name of the IP pool | `string` | n/a | yes |
| <a name="input_lan_id"></a> [lan\_id](#input\_lan\_id) | ID of the LAN whose IP we want to get | `string` | n/a | yes |
| <a name="input_mariadb_password"></a> [mariadb\_password](#input\_mariadb\_password) | The password for the initial mariadb user | `string` | n/a | yes |
| <a name="input_mariadb_username"></a> [mariadb\_username](#input\_mariadb\_username) | The username for the initial mariadb user | `string` | n/a | yes |
| <a name="input_mariadb_version"></a> [mariadb\_version](#input\_mariadb\_version) | Version of MariaDB to deploy | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory per MariaDB instance in GB | `number` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | name of the vm | `string` | n/a | yes |
| <a name="input_storage_size"></a> [storage\_size](#input\_storage\_size) | The amount of storage per instance in gigabytes (GB) | `number` | n/a | yes |
| <a name="input_top_level_domain"></a> [top\_level\_domain](#input\_top\_level\_domain) | Top-level domain mapping for environments | `map(any)` | n/a | yes |
| <a name="input_maintenance_day"></a> [maintenance\_day](#input\_maintenance\_day) | Maintenance day for the MariaDB cluster | `string` | `"Sunday"` | no |
| <a name="input_maintenance_hour"></a> [maintenance\_hour](#input\_maintenance\_hour) | Hour at which maintenance may start | `number` | `3` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | ports to open in the IONOS firewall provided as objects in a list [{protocol = ???, name = ???, port = ???, source\_ip = ???}], source\_ip is optional. | `list` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_basic_vm_lan_ip"></a> [basic\_vm\_lan\_ip](#output\_basic\_vm\_lan\_ip) | The IP address assigned to the basic VM NIC |
| <a name="output_database_ip"></a> [database\_ip](#output\_database\_ip) | IP address of the MariaDB cluster |
| <a name="output_database_ip_cidr"></a> [database\_ip\_cidr](#output\_database\_ip\_cidr) | The CIDR block for the database IP address |
| <a name="output_private_lan_id"></a> [private\_lan\_id](#output\_private\_lan\_id) | The ID of the private LAN for the privacyidea VM and MariaDB cluster |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ionoscloud"></a> [ionoscloud](#requirement\_ionoscloud) | 6.4.14 |
## Resources

| Name | Type |
|------|------|
| [ionoscloud_lan.private_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/lan) | resource |
| [ionoscloud_mariadb_cluster.mariadb_cluster](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/mariadb_cluster) | resource |
| [ionoscloud_nic.basic_vm_nic](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/resources/nic) | resource |
| [ionoscloud_lan.private_lan](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/6.4.14/docs/data-sources/lan) | data source |
<!-- END_TF_DOCS -->