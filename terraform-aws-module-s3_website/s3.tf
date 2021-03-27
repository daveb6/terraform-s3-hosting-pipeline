# .deploy/terraform/static-site/s3.tf
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.domain_name
  acl = "public-read"
  policy = data.aws_iam_policy_document.website_policy.json
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "index.html"
  source = "${path.module}/../src/index.html"
  content_type = "text/html"
  etag   = filemd5("${path.module}/../src/index.html")
}