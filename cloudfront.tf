resource "aws_cloudfront_origin_access_control" "static_website" {
  provider = aws.us-east-1

  name                              = format("%s-origin-access-control", local.prefix)
  description                       = format("%s origni access control", local.prefix)
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "static_website" {
  provider = aws.us-east-1

  origin {
    domain_name              = aws_s3_bucket.static_website.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.static_website.id
    origin_id                = local.prefix
  }

  aliases = [var.cloudfront_domain_name]

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  custom_error_response {
    error_caching_min_ttl = 3600
    error_code            = 403
    response_code         = "200"
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.prefix

    dynamic "lambda_function_association" {
      for_each = var.enable_basic_auth ? [""] : []

      content {
        event_type   = "viewer-request"
        lambda_arn   = aws_lambda_function.basic_auth[0].qualified_arn
        include_body = false
      }
    }

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.static_website.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
