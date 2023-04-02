terraform {
  backend "s3" {
    bucket         = "static-frontend-tfstate-statebucket-1detagzo8ruvw"
    dynamodb_table = "static-frontend-tfstate-LockTable-ZBPRIE0SS6E0"
    key            = "static-frontend"
    region         = "eu-central-1"
  }
}
