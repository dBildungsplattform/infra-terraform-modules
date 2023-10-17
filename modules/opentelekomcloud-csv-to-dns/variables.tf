variable "csv_file_path" {
    type = string
    description = "Path to the CSV file containing the records to create, expected fields are domain, type, record and description (can be empty). Multiple records can be separated using a pipe (|) character."
}

variable "zone_id" {
    type = string
    description = "OTC DNS zone ID."
}