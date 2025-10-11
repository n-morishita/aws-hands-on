resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "website" {
  bucket = "sample-website-bucket-${random_id.bucket_id.hex}"
}

# 静的ウェブサイトホスティング設定
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# パブリックアクセス設定
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
