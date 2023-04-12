resource "aws_s3_bucket" "static_website" {
  bucket_prefix = local.prefix
}

resource "aws_s3_bucket_versioning" "static" {
  bucket = aws_s3_bucket.static_website.id
  versioning_configuration {
    status = var.enable_bucket_versioning ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_policy" "static" {
  bucket = aws_s3_bucket.static_website.id
  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "AllowCloudFrontServicePrincipalReadOnly",
        Effect : "Allow",
        Principal : {
          Service : "cloudfront.amazonaws.com"
        },
        Action : "s3:GetObject",
        Resource : format("%s/*", aws_s3_bucket.static_website.arn),
        Condition : {
          StringEquals : {
            "AWS:SourceArn" : format("arn:aws:cloudfront::%s:distribution/%s", data.aws_caller_identity.current.account_id, aws_cloudfront_distribution.static_website.id)
          }
        }
      },
      {
        Sid : "AllowCloudFrontServicePrincipalListBucket"
        Effect : "Allow",
        Principal : {
          Service : "cloudfront.amazonaws.com"
        },
        Action : "s3:ListBucket",
        Resource : aws_s3_bucket.static_website.arn,
        Condition : {
          StringEquals : {
            "AWS:SourceArn" : format("arn:aws:cloudfront::%s:distribution/%s", data.aws_caller_identity.current.account_id, aws_cloudfront_distribution.static_website.id)
          }
        }
      }
    ]
  })
}
