resource "aws_s3_bucket" "bucket" {
  bucket = "terry-gateway-s3-bucket"

  tags = {
    Name = "hello-bucket"
  }
}

resource "aws_s3_bucket_policy" "vpce" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.s3_vpce.json
}

data "aws_iam_policy_document" "s3_vpce" {
  statement {
    sid    = "Allow-access-to-specific-VPCE"
    effect = "Deny"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.bucket.id}", "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"]
    condition {
      test     = "StringNotEquals"
      values   = [aws_vpc_endpoint.s3.id]
      variable = "aws:sourceVpce"
    }
  }
}