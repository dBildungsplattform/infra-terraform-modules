<!-- BEGIN_TF_DOCS -->

## Providers

No providers.
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cores"></a> [cores](#input\_cores) | Number of CPU cores per MariaDB instance | `number` | n/a | yes |
| <a name="input_cpu_family"></a> [cpu\_family](#input\_cpu\_family) | Type of CPU to use | `string` | n/a | yes |
| <a name="input_datacenter_id"></a> [datacenter\_id](#input\_datacenter\_id) | ID of the datacenter where resources will be deployed | `string` | n/a | yes |
| <a name="input_datacenter_location"></a> [datacenter\_location](#input\_datacenter\_location) | Geographic location of the datacenter | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name for the MariaDB cluster | `string` | n/a | yes |
| <a name="input_fulldomainname"></a> [fulldomainname](#input\_fulldomainname) | Domain under which the basic VM server will be available | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | Image UUID for the VM | `string` | n/a | yes |
| <a name="input_instances_count"></a> [instances\_count](#input\_instances\_count) | Number of instances in the MariaDB cluster | `number` | n/a | yes |
| <a name="input_ip_pool_name"></a> [ip\_pool\_name](#input\_ip\_pool\_name) | Name of the IP pool | `string` | n/a | yes |
| <a name="input_lan_id"></a> [lan\_id](#input\_lan\_id) | LAN ID for connecting the VM and MariaDB cluster | `string` | n/a | yes |
| <a name="input_mariadb_version"></a> [mariadb\_version](#input\_mariadb\_version) | Version of MariaDB to deploy | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory per MariaDB instance in GB | `number` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password for the initial MariaDB admin account | `string` | n/a | yes |
| <a name="input_second_volume_disk_type"></a> [second\_volume\_disk\_type](#input\_second\_volume\_disk\_type) | Disk type of the second volume | `string` | n/a | yes |
| <a name="input_second_volume_size"></a> [second\_volume\_size](#input\_second\_volume\_size) | Size of the second volume in GB | `number` | n/a | yes |
| <a name="input_server_cpu"></a> [server\_cpu](#input\_server\_cpu) | CPU cores allocated to the VM | `number` | n/a | yes |
| <a name="input_server_memory"></a> [server\_memory](#input\_server\_memory) | Memory allocated to the VM | `number` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the server | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Username for the initial MariaDB admin account | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of the primary volume in GB | `number` | n/a | yes |
| <a name="input_maintenance_day"></a> [maintenance\_day](#input\_maintenance\_day) | Maintenance day for the MariaDB cluster | `string` | `"Sunday"` | no |
| <a name="input_maintenance_hour"></a> [maintenance\_hour](#input\_maintenance\_hour) | Hour at which maintenance may start | `number` | `3` | no |
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

No resources.
<!-- END_TF_DOCS -->