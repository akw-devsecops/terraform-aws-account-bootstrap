data "aws_caller_identity" "current" {}

module "github_oidc_provider" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
  version = "5.55.0"
}

module "github_actions_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  version = "5.55.0"

  name = "GitHubActionsManagement"

  subjects = [
    "repo:${var.github_organization}/*",
  ]

  policies = {
    ApplicationRoleManagement = aws_iam_policy.application_role_management.arn
    StateBucketAccess         = var.state_bucket_arn
  }
}

data "aws_iam_policy_document" "application_role_management" {
  statement {
    sid    = "AllowApplicationRoleManagement"
    effect = "Allow"
    actions = [
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:GetRole",
      "iam:PutRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:AttachRolePolicy",
      "iam:DetachRolePolicy",
      "iam:TagRole",
      "iam:ListRoleTags",
      "iam:ListAttachedRolePolicies",
      "iam:ListRolePolicies"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/GitHubActionsApp*"
    ]
  }

  statement {
    sid    = "AllowIAMList"
    effect = "Allow"
    actions = [
      "iam:List*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "application_role_management" {
  name        = "ApplicationRoleManagement"
  description = "Policy for managing application IAM roles for GitHub Actions"
  policy      = data.aws_iam_policy_document.application_role_management.json
}

data "aws_iam_policy_document" "state_bucket_access" {
  statement {
    sid       = "AllowListBucket"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [var.state_bucket_arn]
  }

  statement {
    sid       = "AllowStateBucketAccess"
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["${var.state_bucket_arn}/*"]
  }
}

resource "aws_iam_policy" "state_bucket_access" {
  name        = "GitHubActionsStateBucketAccess"
  description = "Policy to access Terraform state bucket"
  policy      = data.aws_iam_policy_document.state_bucket_access.json
}
