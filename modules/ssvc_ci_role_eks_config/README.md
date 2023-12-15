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
| <a name="module_this"></a> [this](#module\_this) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_state_bucket_arn"></a> [state\_bucket\_arn](#input\_state\_bucket\_arn) | n/a | `string` | n/a | yes |
| <a name="input_enable_eks_ci_role"></a> [enable\_eks\_ci\_role](#input\_enable\_eks\_ci\_role) | n/a | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->