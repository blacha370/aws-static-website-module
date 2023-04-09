data "archive_file" "basic_auth" {
  count = var.enable_basic_auth ? 1 : 0

  output_path = format("%s/basic-auth-lambda/lambda.zip", path.module)
  type        = "zip"

  source {
    content  = templatefile(format("%s/basic-auth-lambda/index.js.tftpl", path.module), { username = "username", password = "password" })
    filename = "index.js"
  }
}

resource "aws_lambda_function" "basic_auth" {
  count = var.enable_basic_auth ? 1 : 0

  provider = aws.us-east-1

  function_name = format("%s-basic-auth", local.prefix)
  role          = aws_iam_role.basic_auth[0].arn
  publish       = true

  handler          = "index.handler"
  memory_size      = 128
  runtime          = "nodejs16.x"
  source_code_hash = data.archive_file.basic_auth[0].output_base64sha256
  filename         = data.archive_file.basic_auth[0].output_path
}