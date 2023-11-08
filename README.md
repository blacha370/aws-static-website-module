# aws-static-website-module
## Table of Contents
- [Architecture diagram](#architecture-diagram)
- [Usage](#usage)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Architecture diagram

![diagram](/docs/diagram.jpg)

## Usage

### Static website without basic auth
```hcl
module "static_website" {
  source = "github.com/blacha370/aws-static-website-module"

  providers = {
    aws.src       = aws
    aws.us-east-1 = aws.us-east-1
  }

  project     = "example"
  environment = "example"

  route53_zone_id = "ZONE_ID"
}
```
### Examples:

- [Complete](https://github.com/blacha370/aws-static-website-module/tree/main/example) 


## Resources
| Name | Type |
|------|------|
| archive_file.basic_auth | data source |
| aws_acm_certificate.static_website | resource |
| aws_acm_certificate_validation.static_website | resource |
| aws_caller_identity.current | data source |
| aws_cloudfront_distribution.static_website | resource |
| aws_cloudfront_origin_access_control.static_website | resource |
| aws_iam_role.basic_auth | resource |
| aws_lambda_function.basic_auth | resource |
| aws_route53_record.certificate | resource |
| aws_route53_record.static_website | resource |
| aws_route53_zone.dns_zone | data source |
| aws_s3_bucket.static_website | resource |
| aws_s3_bucket_policy.static | resource |
| aws_s3_bucket_versioning.static | resource |
| random_password.basic_auth_password | resource |
| random_string.basic_auth_user | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| basic_auth_password | Password for basic auth lambda, random password will be created if this variable is empty | `string` | `""` | no |
| basic_auth_user | Username for basic auth lambda, random string will be created if this variable is empty | `string` | `""` | no |
| cloudfront_404_file | Custom 404 file, use `/index.html` if error should be resolved by app | `string` | `"/404.html"` | no |
| default_ttl | Default ttl for Cloudfront cache | `number` | 3600 | no |
| enable_basic_auth | Controls if basic auth lambda should be created | `bool` | `false` | no |
| enable_bucket_versioning | Controls S3 bucket versioning | `bool` | `false` | no |
| environment | Environment name | `string` | `null` | yes |
| error_caching_min_ttl | Mimimum ttl for 404 response cache | `number` | 3600 | no |
| min_ttl | Minimum ttl for Cloudfront cache | `number` | 0 | no |
| max_ttl | Maximum ttl for Cloudfront cache | `number` | 86400 | no |
| project | Project name | `string` | `null` | yes |
| route53_subdomain_prefix | Cloudfront subdomain prefix | `string` | `""` | no |
| route53_zone_id | Existing route53 zone id | `string` | `null` | yes |

## Outputs
| Name | Description |
|------|-------------|
| basic_auth_password | Basic auth password | 
| basic_auth_user | Basic auth username |
| cloudfront_domain_name | Cloudfront domain name |
| s3_bucket_name | Source s3 bucket name |
