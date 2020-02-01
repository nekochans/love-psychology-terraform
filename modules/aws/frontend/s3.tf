resource "aws_s3_bucket" "frontend_hosting_bucket" {
  bucket = lookup(
    var.frontend,
    "${terraform.workspace}.hosting_bucket_name",
    var.frontend["default.hosting_bucket_name"],
  )
  force_destroy = true

  lifecycle_rule {
    enabled                                = true
    abort_incomplete_multipart_upload_days = 7
  }
}

resource "aws_s3_bucket" "frontend_access_logs" {
  bucket = lookup(
    var.frontend,
    "${terraform.workspace}.access_log_bucket_name",
    var.frontend["default.access_log_bucket_name"],
  )
  force_destroy = true

  lifecycle_rule {
    enabled                                = true
    abort_incomplete_multipart_upload_days = 7
  }
}
