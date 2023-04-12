# static-frontend-infrastructur
## Table of Contents
- [Usage](#usage)
    - [State configuration](#state-configuration)
    - [Route53 configuration](#route53-configuration)
    - [Working with multiple environments](#working-with-multiple-environments)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Usage
### State Configuration

Create state bucket and lock table.

```
aws cloudformation deploy \
--template-file tfstate.yml \
--stack-name static-frontend-tfstate
```

Get state bucket name and lock table name.

```
aws cloudformation describe-stacks \
--stack-name static-frontend-tfstate \
--query "Stacks[?StackName=='static-frontend-tfstate'].Outputs[]"
```

Update `bucket`, `dynamodb_table` and `region` in `terraform.tf` file, then init terraform.

```
terraform init
```

### Route53 configuration

This module requires route53 zone to exist within your AWS account. Follow [Creating a public hosted zone](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingHostedZone.html) tutorial if you don't have one.

### Working with multiple environments

For multiple environments use terraform workspace. 

Create new environment/workspace.

```
terraform workspace new <environment>
```

Switch between environments/workspaces.

```
terraform workspace select <environment>
```

List existing environments/workspaces.

```
terraform workspace list
```

Create `.tfvars` files for each workspace (check [example.tfvars](/example.tfvars)), eg. `terraform.<workspace>.tfvars`, then include this file in terraform commands.

```
terraform plan -var-file=terraform.<workspace>.tfvars
terraform apply -var-file=terraform.<workspace>.tfvars
```

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
| cloudfront_domain_name | Route53 record pointing to cloudfront | `string` | `null` | yes |
| dns_zone | Existing route53 zone name | `string` | `null` | yes |
| enable_basic_auth | Controls if basic auth lambda should be created | `bool` | `false` | no |
| enable_bucket_versioning | Controls S3 bucket versioning | `bool` | `false` | no |
| project | Project name | `string` | `""` | yes |

## Outputs
| Name | Description |
|------|-------------|
| basic_auth_password | Basic auth password | 
| basic_auth_user | Basic auth username |
| cloudfront_domain_name | Cloudfront domain name |
| s3_bucket_name | Source s3 bucket name |
