# terraform-aws-account-bootstrap
Terraform Module to bootstrap AWS accounts.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ci_role"></a> [ci\_role](#module\_ci\_role) | ./modules/ci_role | n/a |
| <a name="module_github_actions_role"></a> [github\_actions\_role](#module\_github\_actions\_role) | ./modules/github_actions_role | n/a |
| <a name="module_ssvc_ci_role_eks"></a> [ssvc\_ci\_role\_eks](#module\_ssvc\_ci\_role\_eks) | ./modules/ssvc_ci_role_eks | n/a |
| <a name="module_ssvc_ci_role_eks_config"></a> [ssvc\_ci\_role\_eks\_config](#module\_ssvc\_ci\_role\_eks\_config) | ./modules/ssvc_ci_role_eks_config | n/a |
| <a name="module_state_bucket"></a> [state\_bucket](#module\_state\_bucket) | ./modules/state_bucket | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_environment"></a> [account\_environment](#input\_account\_environment) | n/a | `string` | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | GitHub organization name for OIDC provider | `string` | n/a | yes |
| <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository) | GitHub repository name for OIDC provider | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_trusted_ci_role_arn"></a> [trusted\_ci\_role\_arn](#input\_trusted\_ci\_role\_arn) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |
| <a name="input_enable_eks_ci_config_role"></a> [enable\_eks\_ci\_config\_role](#input\_enable\_eks\_ci\_config\_role) | n/a | `bool` | `true` | no |
| <a name="input_enable_eks_ci_role"></a> [enable\_eks\_ci\_role](#input\_enable\_eks\_ci\_role) | n/a | `bool` | `true` | no |
| <a name="input_trusted_ci_role_arns"></a> [trusted\_ci\_role\_arns](#input\_trusted\_ci\_role\_arns) | n/a | `set(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->