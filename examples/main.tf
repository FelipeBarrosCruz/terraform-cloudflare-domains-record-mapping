provider "cloudflare" {}

module "cloudflare" {
  source = "felipebarroscruz/domains-record-mapping/cloudflare"
  domains = {
    zone1 = {
      domain = "zone1.com",
      type   = "CNAME"
      records = [
        "example1",
        "example2",
      ]
      proxied = true
      value   = "DNS_AS_CNAME"
    }
    zone2 = {
      domain = "zone2.com"
      type   = "CNAME"
      records = [
        "example3",
        "example4.example5.example6",
      ]
      proxied = false
      value   = "DNS_AS_CNAME"
    }
  }
}
