resource "aws_cloudfront_origin_access_identity" "love_psychology_web_origin_access_identity" {
  comment = "${aws_s3_bucket.frontend_hosting_bucket.bucket} origin access identity"
}

data "aws_iam_policy_document" "read_love_psychology_web" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.frontend_hosting_bucket.arn}/*"]

    principals {
      identifiers = [aws_cloudfront_origin_access_identity.love_psychology_web_origin_access_identity.iam_arn]
      type        = "AWS"
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.frontend_hosting_bucket.arn]

    principals {
      identifiers = [aws_cloudfront_origin_access_identity.love_psychology_web_origin_access_identity.iam_arn]
      type        = "AWS"
    }
  }
}

resource "aws_s3_bucket_policy" "read_psychology_web" {
  bucket = aws_s3_bucket.frontend_hosting_bucket.id
  policy = data.aws_iam_policy_document.read_love_psychology_web.json
}

resource "aws_cloudfront_distribution" "love_psychology_web" {
  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      cookies {
        forward = "none"
      }

      query_string = true
    }

    target_origin_id       = "S3-${aws_s3_bucket.frontend_hosting_bucket.bucket}"
    viewer_protocol_policy = "https-only"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "love-psychology-web"
  default_root_object = "index.html"

  aliases = ["${lookup(
    var.frontend,
    "${terraform.workspace}.sub_domain_name",
    var.frontend["default.sub_domain_name"]
    )}.${lookup(
    var.main_domain_name,
    "${terraform.workspace}.name",
    var.main_domain_name["default.name"]
  )}"]

  logging_config {
    bucket          = aws_s3_bucket.frontend_access_logs.bucket_domain_name
    include_cookies = false
    prefix          = "raw/"
  }

  origin {
    domain_name = aws_s3_bucket.frontend_hosting_bucket.bucket_domain_name
    origin_id   = "S3-${aws_s3_bucket.frontend_hosting_bucket.bucket}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.love_psychology_web_origin_access_identity.cloudfront_access_identity_path
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm["main_arn"]
    minimum_protocol_version = "TLSv1_2016"
    ssl_support_method       = "sni-only"
  }

  custom_error_response {
    error_code            = 403
    error_caching_min_ttl = 300
    response_page_path    = "/index.html"
    response_code         = 200
  }

  custom_error_response {
    error_code            = 404
    error_caching_min_ttl = 300
    response_page_path    = "/index.html"
    response_code         = 200
  }
}
