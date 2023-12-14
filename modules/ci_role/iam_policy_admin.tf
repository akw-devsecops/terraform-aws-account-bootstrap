data "aws_iam_policy_document" "admin_access" {
  statement {
    sid    = "IAMPolicyAdminAccess"
    effect = "Allow"
    actions = [
      "*",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "admin_access" {
  name        = "admin_access"
  description = "Policy used by Terraform"
  policy      = data.aws_iam_policy_document.admin_access.json
}
