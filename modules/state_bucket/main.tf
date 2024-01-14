module "tf_state_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"

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
