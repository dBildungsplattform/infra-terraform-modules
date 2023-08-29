
#
# [<instance_id>.]<instance_location>.<domain>
#
output "subdomain_level_1" {
  value = local.subdomain_level_1
}

#
# [<stage>.][<instance_id>.]<instance_location>.<domain>
#
output "subdomain_level_2" {
  value = local.subdomain_level_2
}

#
# [<service>.][<stage>.][<instance_id>.]<instance_location>.<domain>
#
# Examples:
# service: echo1, stage: "", instance_id: feature-ops-2360, instance_location: marbarte, domain: hpi-schul-cloud.org
# echo1.feature-ops-2360.marbarte.hpi-schul-cloud.org
#
# service: storage, stage: staging, instance_id: "", instance_location: niedersachsen, domain: hpi-schul-cloud.org
# storage.staging.niedersachsen.hpi-schul-cloud.org
#
output "internal_alias_dns" {
  value = local.internal_alias_dns
}

#
# [<instance_id>-]<instance_location>
#
# Examples:
# service: echo1, stage: "", instance_id: feature-ops-2360, instance_location: marbarte, domain: hpi-schul-cloud.org
# feature-ops-2360-marbarte
#
# instance_id: feature-ops-2360, instance_location: niedersachsen
# feature-ops-2360-niedersachsen
#
output "instance" {
  value = local.instance
}
