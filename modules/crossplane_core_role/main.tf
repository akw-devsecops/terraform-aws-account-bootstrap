
#
# crossplane core iam role
#
module "crossplane_core_iam_role" {
  count = var.env == "prod" ? 1 : 0

  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.55.0"

  create_role = true

  role_name         = "ssvc_crossplane_core_${var.account_environment}"
  role_requires_mfa = false

  create_custom_role_trust_policy = true
  custom_role_trust_policy        = data.aws_iam_policy_document.order_adapter_trust_policy.json

  custom_role_policy_arns = [
    aws_iam_policy.order_adapter.arn
  ]
}

data "aws_iam_policy_document" "crossplane_core_iam_role" {
  count = var.env == "prod" ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "oidc.eks.${var.region}.amazonaws.com/id/${var.oidc_provider_id}:sub"
      values   = ["system:serviceaccount:tools:crossplane-sa"]
    }

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.eu-central-1.amazonaws.com/id/${var.oidc_provider_id}"]
    }
  }
}