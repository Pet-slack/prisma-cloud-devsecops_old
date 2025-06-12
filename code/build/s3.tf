provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev1_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment      = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev1_s3" {
  bucket = aws_s3_bucket.dev1_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
