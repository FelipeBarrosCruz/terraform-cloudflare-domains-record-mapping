output "domains" {
  value       = data.cloudflare_zone.domains
  description = "The data list of the mapped domains as zone"
}

output "records" {
  value       = cloudflare_record.records
  description = "The data list of DNS Zone records created"
}
