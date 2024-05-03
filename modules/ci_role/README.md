<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ssvc_ci_role"></a> [ssvc\_ci\_role](#module\_ssvc\_ci\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.admin_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.admin_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_environment"></a> [account\_environment](#input\_account\_environment) | n/a | `string` | n/a | yes |
| <a name="input_trusted_ci_role_arn"></a> [trusted\_ci\_role\_arn](#input\_trusted\_ci\_role\_arn) | n/a | `string` | n/a | yes |
| <a name="input_trusted_ci_role_arns"></a> [trusted\_ci\_role\_arns](#input\_trusted\_ci\_role\_arns) | n/a | `set(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->