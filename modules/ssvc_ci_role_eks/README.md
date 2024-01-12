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
| <a name="module_ssvc_ci_role_eks"></a> [ssvc\_ci\_role\_eks](#module\_ssvc\_ci\_role\_eks) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.ssvc_cluster_ci_role_terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ssvc_cluster_ci_role_terraform_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.ssvc_cluster_ci_role_terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssvc_cluster_ci_role_terraform_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ci_role_arn"></a> [ci\_role\_arn](#input\_ci\_role\_arn) | n/a | `string` | n/a | yes |
| <a name="input_trusted_ci_role_arn"></a> [trusted\_ci\_role\_arn](#input\_trusted\_ci\_role\_arn) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |
| <a name="input_enable_eks_ci_role"></a> [enable\_eks\_ci\_role](#input\_enable\_eks\_ci\_role) | n/a | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->