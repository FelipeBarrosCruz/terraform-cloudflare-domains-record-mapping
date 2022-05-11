data "cloudflare_zone" "domains" {
  for_each = var.domains
  name     = each.value.domain
}

resource "cloudflare_record" "records" {
  for_each = local.records

  zone_id = each.value.id
  name    = each.value.record
  value   = each.value.value
  type    = each.value.type
  proxied = each.value.proxied

  depends_on = [
    data.cloudflare_zone.domains
  ]
}
