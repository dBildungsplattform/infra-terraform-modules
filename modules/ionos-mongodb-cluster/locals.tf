locals{
    # Workaround
    # There's probably a bug in the IONOS Provider: The DataSource ionoscloud_mongo_template doesn't define id
    # as computed, leading to an inconsistent final plan (id is null instead of unknown in the initial plan)
    # This local is in between and the output is unknown in the initial plan, solving the problem.
    mongo_template_id = var.resource_template == null ? null : data.ionoscloud_mongo_template.mongo_template[0].id
}