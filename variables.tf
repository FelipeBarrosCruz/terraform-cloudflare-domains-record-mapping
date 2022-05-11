variable "domains" {
  type = map(object({
    domain  = string,
    type    = string
    records = list(string)
    proxied = bool
    value   = string
  }))

  description = "The list of domains to map and after mapped create the records sets to the DNS"
}
