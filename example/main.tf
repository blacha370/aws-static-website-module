data "aws_route53_zone" "dns_zone" {
  name = "example.com"
}

module "static_website" {
  source = "../"

  providers = {
    aws.src       = aws
    aws.us-east-1 = aws.us-east-1
  }

  project     = "example"
  environment = terraform.workspace

  enable_basic_auth = false
  # basic_auth_user     = ""
  # basic_auth_password = ""

  cloudfront_404_file = "/404.html"

  route53_zone_id          = data.aws_route53_zone.dns_zone.zone_id
  route53_subdomain_prefix = ""

  enable_bucket_versioning = false
}
