locals {
  records_mapped = flatten([
    for key, domain in data.cloudflare_zone.domains : [
      for _, record in var.domains[key].records : {
        key     = key
        id      = domain.id,
        record  = record
        type    = var.domains[key].type
        value   = var.domains[key].value
        proxied = var.domains[key].proxied
      }
    ]
  ])

  records_keys = [
    for k, v in local.records_mapped : format("%s_%s", v.key, replace(v.record, "/\\./", "_"))
  ]
  records = zipmap(local.records_keys, local.records_mapped)
}
