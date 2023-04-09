output "s3_bucket_name" {
  value = aws_s3_bucket.static_website.bucket
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.static_website.domain_name
}

output "basic_auth_user" {
  value = var.enable_basic_auth ? local.basic_auth_user : "Basic auth is disabled"
}

output "basic_auth_password" {
  value = var.enable_basic_auth ? local.basic_auth_password : "Basic auth is disabled"
}
