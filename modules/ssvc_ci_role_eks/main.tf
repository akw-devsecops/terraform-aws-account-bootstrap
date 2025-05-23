data "aws_caller_identity" "current" {}

module "ssvc_ci_role_eks" {
  count = (var.enable_eks_ci_role ? 1 : 0)

  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.55.0"

  create_role = true

  role_name         = "ssvc_ci_role_eks"
  role_requires_mfa = false

  trusted_role_arns = ["arn:aws:iam::335922408564:role/ci-devsecops", "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/SAML-AKW-ADMIN"]
  custom_role_policy_arns = [
    aws_iam_policy.ssvc_cluster_ci_role_terraform[0].arn,
    aws_iam_policy.ssvc_cluster_ci_role_terraform_read[0].arn
  ]
}

resource "aws_iam_policy" "ssvc_cluster_ci_role_terraform" {
  count = (var.enable_eks_ci_role ? 1 : 0)

  name   = "ssvc_cluster_ci_role_terraform"
  policy = data.aws_iam_policy_document.ssvc_cluster_ci_role_terraform.json
}

data "aws_iam_policy_document" "ssvc_cluster_ci_role_terraform" {
  statement {
    sid    = "EC2"
    effect = "Allow"
    actions = [
      "ec2:AllocateAddress",
      "ec2:CreateNetworkInterface",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:CreateLaunchTemplate",
      "ec2:CreateLaunchTemplateVersion",
      "ec2:CreateSecurityGroup",
      "ec2:CreateTags",
      "ec2:DeleteLaunchTemplate",
      "ec2:DeleteLaunchTemplateVersions",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteTags",
      "ec2:ModifyLaunchTemplate",
      "ec2:ModifySecurityGroupRules",
      "ec2:ReleaseAddress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:RunInstances",
      "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
      "ec2:UpdateSecurityGroupRuleDescriptionsIngress",
    ]
    resources = [
      "arn:aws:ec2:eu-central-1::image/*",
      "arn:aws:ec2:eu-central-1:${data.aws_caller_identity.current.account_id}:elastic-ip/*",
      "arn:aws:ec2:eu-central-1:${data.aws_caller_identity.current.account_id}:launch-template/*",
      "arn:aws:ec2:eu-central-1:${data.aws_caller_identity.current.account_id}:instance/*",
      "arn:aws:ec2:eu-central-1:${data.aws_caller_identity.current.account_id}:network-interface/*",
      "arn:aws:ec2:eu-central-1:${data.aws_caller_identity.current.account_id}:security-group/*",
      "arn:aws:ec2:eu-central-1:${data.aws_caller_identity.current.account_id}:subnet/*",
      "arn:aws:ec2:eu-central-1:${data.aws_caller_identity.current.account_id}:volume/*",
      "arn:aws:ec2:eu-central-1:${data.aws_caller_identity.current.account_id}:vpc/${var.vpc_id}",
    ]
  }

  statement {
    sid    = "Cloudwatch"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:DeleteLogGroup",
      "logs:ListTagsLogGroup",
      "logs:ListTagsForResource",
      "logs:PutRetentionPolicy",
      "logs:TagLogGroup",
    ]
    resources = [
      "arn:aws:logs:eu-central-1:${data.aws_caller_identity.current.account_id}:log-group:/aws/eks/*/cluster",
      "arn:aws:logs:eu-central-1:${data.aws_caller_identity.current.account_id}:log-group:/aws/eks/*/cluster:*"
    ]
  }

  statement {
    sid    = "IAMPassRole"
    effect = "Allow"
    actions = [
      "iam:PassRole"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["eks.amazonaws.com"]
    }
  }

  statement {
    sid    = "IAM"
    effect = "Allow"
    actions = [
      "iam:AttachRolePolicy",
      "iam:CreateOpenIDConnectProvider",
      "iam:CreatePolicy",
      "iam:CreatePolicyVersion",
      "iam:CreateRole",
      "iam:CreateServiceLinkedRole",
      "iam:DeleteOpenIDConnectProvider",
      "iam:DeletePolicy",
      "iam:DeleteRole",
      "iam:DeleteRolePolicy",
      "iam:DeletePolicyVersion",
      "iam:DetachRolePolicy",
      "iam:GetOpenIDConnectProvider",
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:GetRole",
      "iam:GetRolePolicy",
      "iam:ListAttachedRolePolicies",
      "iam:ListInstanceProfilesForRole",
      "iam:ListPolicyVersions",
      "iam:ListOpenIDConnectProviders",
      "iam:ListOpenIDConnectProviderTags",
      "iam:ListRolePolicies",
      "iam:ListRoleTags",
      "iam:ListRoles",
      "iam:PutRolePolicy",
      "iam:TagOpenIDConnectProvider",
      "iam:TagPolicy",
      "iam:TagRole",
      "iam:UntagOpenIDConnectProvider",
      "iam:UpdateAssumeRolePolicy",
      "iam:UpdateOpenIDConnectProviderThumbprint",
    ]
    resources = [
      "*" // TODO add boundaries
    ]
  }

  statement {
    sid    = "Autoscaling"
    effect = "Allow"
    actions = [
      "autoscaling:*",
    ]
    resources = [
      "*" // TODO add boundaries
    ]
  }

  statement {
    sid    = "EKS"
    effect = "Allow"
    actions = [
      "eks:*",
    ]
    resources = [
      "*"
    ]
  }

  statement {
    sid    = "KMS"
    effect = "Allow"
    actions = [
      "kms:*",
    ]
    resources = [
      "*"
    ]
  }

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
}

resource "aws_iam_policy" "ssvc_cluster_ci_role_terraform_read" {
  count = (var.enable_eks_ci_role ? 1 : 0)

  name   = "ssvc_cluster_ci_role_terraform_read"
  policy = data.aws_iam_policy_document.ssvc_cluster_ci_role_terraform_read.json
}

data "aws_iam_policy_document" "ssvc_cluster_ci_role_terraform_read" {
  statement {
    sid    = "ReadEC2"
    effect = "Allow"
    actions = [
      "ec2:DescribeAddresses",
      "ec2:DescribeAddressesAttribute",
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeLaunchTemplateVersions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeSecurityGroupRules",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeTags",
      "ec2:DescribeVpcAttribute",
      "ec2:DescribeVpcs",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "ReadCloudwatch"
    effect = "Allow"
    actions = [
      "logs:DescribeLogGroups",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "ReadSSM"
    effect = "Allow"
    actions = [
      "ssm:GetParameter",
    ]
    resources = [
      "arn:aws:ssm:eu-central-1:${data.aws_caller_identity.current.account_id}:parameter/NewRelicLicenseKey"
    ]
  }
}