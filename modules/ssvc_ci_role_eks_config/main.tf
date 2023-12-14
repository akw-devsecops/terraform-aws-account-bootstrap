data "aws_caller_identity" "current" {}

module "this" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.0"

  create_role = true

  role_name         = "ssvc_ci_role_eks_config"
  role_requires_mfa = false

  trusted_role_arns = ["arn:aws:iam::335922408564:role/ci-devsecops"]
  custom_role_policy_arns = [
    aws_iam_policy.this.arn,
  ]
}

data "aws_iam_policy_document" "this" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [var.state_bucket_arn]
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["${var.state_bucket_arn}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ssm:GetParameter",
    ]
    resources = [
      "arn:aws:ssm:eu-central-1:${data.aws_caller_identity.current.account_id}:parameter/NewRelicApiKey",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "eks:DescribeCluster",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "this" {
  name        = "ssvc_ci_role_eks_config"
  description = "Policy used by Terraform to manage s3"
  policy      = data.aws_iam_policy_document.this.json
}