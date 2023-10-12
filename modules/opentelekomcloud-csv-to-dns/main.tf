resource "opentelekomcloud_dns_recordset_v2" "records" {

  for_each = { for record in csvdecode(file(var.csv_file_path)) : record.domain => record }

  zone_id = var.zone_id
  name    = lower("${each.value.domain}")
  ttl     = 300
  type    = each.value.type
  # txt records have a max length of 255 characters
  records = [replace(each.value.record, "/(.{255})/", "$1\" \"")]

  lifecycle {
    ignore_changes = [zone_id]
  }
}