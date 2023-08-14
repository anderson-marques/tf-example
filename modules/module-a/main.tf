variable "bucket_name" {
  type = string
}

resource "random_string" "random_suffix" {
  length  = 3
  special = false
  upper   = false
  keepers = {
    bucket_name = var.bucket_name
  }
}

resource "aws_s3_bucket" "name" {
  name = "${var.bucket_name}-${random_string.random_suffix.result}"
}