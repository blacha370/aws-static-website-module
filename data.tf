data "aws_caller_identity" "current" {}

data "aws_route53_zone" "dns_zone" {
  zone_id = var.route53_zone_id
}

data "archive_file" "basic_auth" {
  count = var.enable_basic_auth ? 1 : 0

  output_path = format("%s/basic-auth-lambda/lambda.zip", path.module)
  type        = "zip"

  source {
    content  = templatefile(format("%s/basic-auth-lambda/index.js.tftpl", path.module), { username = local.basic_auth_user, password = local.basic_auth_password })
    filename = "index.js"
  }
}
