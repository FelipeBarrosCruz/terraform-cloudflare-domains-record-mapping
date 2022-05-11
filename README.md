# terraform-cloudflare-domains-record-mapping
This module makes it easy to create one or more records and assign to a DNS Zone in cloudflare.


<!-- BEGIN_TF_DOCS -->


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.records](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.domains](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domains"></a> [domains](#input\_domains) | The list of domains to map and after mapped create the records sets to the DNS | <pre>map(object({<br>    domain  = string,<br>    type    = string<br>    records = list(string)<br>    proxied = bool<br>    value   = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domains"></a> [domains](#output\_domains) | The data list of the mapped domains as zone |
| <a name="output_records"></a> [records](#output\_records) | The data list of DNS Zone records created |

## Example
```hcl
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
```
<!-- END_TF_DOCS -->

