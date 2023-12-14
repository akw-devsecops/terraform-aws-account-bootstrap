### Modules

module "ci_role" {
  source                            = "./modules/ci_role"
  account_environment               = var.account_environment
  devsecops_platform_account_number = var.devsecops_platform_account_number
  devsecops_ci_role_name            = var.devsecops_ci_role_name
}

module "state_bucket" {
  source              = "./modules/state_bucket"
  account_environment = var.account_environment
  project_name        = var.project_name

}

module "ssvc_ci_role_eks_config" {
  source = "./modules/ssvc_ci_role_eks_config"

  state_bucket_arn = module.state_bucket.s3_bucket_arn
}
