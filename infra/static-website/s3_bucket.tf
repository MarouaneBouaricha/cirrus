resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "bucket-happybit-3489-${var.environment}"

  tags = {
    Name        = "static-website"
    Environment = var.environment
  }
}

// allow public access
resource "aws_s3_bucket_public_access_block" "static_website_bucket_public_access" {
  bucket = aws_s3_bucket.static_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

//enable static-site hosting
resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "static_website_bucket_policy" {
  bucket = aws_s3_bucket.static_website_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetObj",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.static_website_bucket.id}/*"
    }
  ]
}
POLICY
}