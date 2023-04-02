terraform {
  backend "s3" {
    bucket         = "static-frontend-tfstate-statebucket-1detagzo8ruvw"  # Replace with StateBucketName output value
    dynamodb_table = "static-frontend-tfstate-LockTable-ZBPRIE0SS6E0"     # Replace with LockTableName output value
    region         = "eu-central-1"                                       # Replace with Region output value
    key            = "static-frontend"                     
  }
}
