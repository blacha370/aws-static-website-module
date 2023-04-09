# static-frontend-infrastructur
## Table of Contents
- [Usage](#usage)
    - [Initial configuration](#initial-configuration)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Usage
### Initial Configuration

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project | Project name | `string` | `""` | yes |
| basic_auth_password | Password for basic auth lambda, random password will be created if this variable is empty | `string` | `""` | no |
| basic_auth_user | Username for basic auth lambda, random string will be created if this variable is empty | `string` | `""` | no |
| enable_basic_auth | Controls if basic auth lambda should be created | `bool` | `"false"` | no |

## Outputs
| Name | Description |
|------|-------------|
| basic_auth_password | Basic auth password | 
| basic_auth_user | Basic auth username |
| cloudfront_domain_name | Cloudfront domain name |
| s3_bucket_name | Source s3 bucket name |
