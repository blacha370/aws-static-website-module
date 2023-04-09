resource "aws_iam_role" "basic_auth" {
  count = var.enable_basic_auth ? 1 : 0

  name = format("%s-lambda-basic-auth", local.prefix)

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : [
            "lambda.amazonaws.com",
            "edgelambda.amazonaws.com"
          ]
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}
