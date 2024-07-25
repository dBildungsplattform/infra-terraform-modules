data "ionoscloud_mongo_template" "mongo_template" {
  count = var.resource_template == null ? 0 : 1
  name = var.resource_template
}

# Workaround
# There's probably a bug in the IONOS Provider: The DataSource ionoscloud_mongo_template doesn't define id
# as computed, leading to an inconsistent final plan (id is null instead of unknown in the initial plan)
# This null_data_source is in between and the output is unknown in the initial plan, solving the problem.
data "null_data_source" "template_workaround" {
  inputs = {
    mongo_template_id = var.resource_template == null ? null : data.ionoscloud_mongo_template.mongo_template[0].id
  }
  depends_on = [ data.ionoscloud_mongo_template.mongo_template ]
}