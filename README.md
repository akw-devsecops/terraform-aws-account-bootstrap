# terraform-aws-account-bootstrap
Terraform Module to bootstrap AWS accounts

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ci_role"></a> [ci\_role](#module\_ci\_role) | ./modules/ci_role | n/a |
| <a name="module_ssvc_ci_role_eks_config"></a> [ssvc\_ci\_role\_eks\_config](#module\_ssvc\_ci\_role\_eks\_config) | ./modules/ssvc_ci_role_eks_config | n/a |
| <a name="module_state_bucket"></a> [state\_bucket](#module\_state\_bucket) | ./modules/state_bucket | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_environment"></a> [account\_environment](#input\_account\_environment) | n/a | `string` | n/a | yes |
| <a name="input_ci_role_arn"></a> [ci\_role\_arn](#input\_ci\_role\_arn) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->