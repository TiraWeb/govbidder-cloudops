variable "env" {}

resource "aws_s3_bucket" "docs" {
  bucket = "govbidder-docs-${var.env}"
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id = "auto-expire"
    enabled = true

    expiration {
      days = 7
    }
  }
}

output "bucket_name" {
  value = aws_s3_bucket.docs.bucket
}

