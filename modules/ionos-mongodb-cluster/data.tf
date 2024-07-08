data "ionoscloud_mongo_template" "mongo_template" {
  count = var.resource_template == null ? 0 : 1
  name = var.resource_template
}