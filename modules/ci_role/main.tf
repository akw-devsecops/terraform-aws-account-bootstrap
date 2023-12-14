data "aws_caller_identity" "current" {}

module "ssvc_ci_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  create_role = true

  role_name         = "ssvc_ci_role_${var.account_environment}"
  role_requires_mfa = false

  trusted_role_arns = ["arn:aws:iam::${var.devsecops_platform_account_number}:role/${var.devsecops_ci_role_name}", "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/SAML-AKW-ADMIN"]
  custom_role_policy_arns = [
    aws_iam_policy.admin_access.arn
  ]
}
