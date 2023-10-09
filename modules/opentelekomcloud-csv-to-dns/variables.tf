variable "file_path" {
    type = string
    description = "Path to the CSV file containing the records to create, expected fields are domain, type and record."
}

variable "zone_id" {
    type = string
    description = "OTC DNS zone ID."
}