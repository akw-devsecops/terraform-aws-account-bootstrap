module "tf_state_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.9.0"

  bucket = "${var.project_name}-state-${var.account_environment}"

  attach_deny_insecure_transport_policy = true

  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"

  acl                     = "private"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  versioning = {
    enabled = true
  }

  tags = {
    role = "storage"
  }
}

data "aws_iam_policy_document" "state_bucket_access" {
  statement {
    sid       = "AllowListBucket"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [module.tf_state_bucket.s3_bucket_arn]
  }

  statement {
    sid       = "AllowStateBucketAccess"
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["${module.tf_state_bucket.s3_bucket_arn}/*"]
  }
}

resource "aws_iam_policy" "state_bucket_access" {
  name        = "GitHubActionsStateBucketAccess"
  description = "Policy to access Terraform state bucket"
  policy      = data.aws_iam_policy_document.state_bucket_access.json
}
