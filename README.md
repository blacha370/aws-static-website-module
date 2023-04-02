# static-frontend-infrastructur
## Table of Contents
- [Usage](#usage)
    - [Initial configuration](#initial-configuration)

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