<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider\_opentelekomcloud) | n/a |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_csv_file_path"></a> [csv\_file\_path](#input\_csv\_file\_path) | Path to the CSV file containing the records to create, expected fields are domain, type and record. | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | OTC DNS zone ID. | `string` | n/a | yes |
## Outputs

No outputs.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.4 |
## Resources

| Name | Type |
|------|------|
| [opentelekomcloud_dns_recordset_v2.records](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2) | resource |
<!-- END_TF_DOCS -->