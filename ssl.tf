resource "aws_acm_certificate" "static_website" {
  provider = aws.us-east-1

  domain_name       = var.cloudfront_domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "static_website" {
  provider = aws.us-east-1

  certificate_arn         = aws_acm_certificate.static_website.arn
  validation_record_fqdns = [for record in aws_route53_record.certificate : record.fqdn]
}
