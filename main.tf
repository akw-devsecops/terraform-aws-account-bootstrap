### Modules

module "ci_role" {
  source              = "./modules/ci_role"
  account_environment = var.account_environment
  trusted_ci_role_arn = var.ci_role_arn
}

module "state_bucket" {
  source              = "./modules/state_bucket"
  account_environment = var.account_environment
  project_name        = var.project_name

}

module "ssvc_ci_role_eks_config" {
  source = "./modules/ssvc_ci_role_eks_config"

  state_bucket_arn          = module.state_bucket.s3_bucket_arn
  enable_eks_ci_config_role = var.enable_eks_ci_config_role
}

module "ssvc_ci_role_eks" {
  source = "./modules/ssvc_ci_role_eks"

  vpc_id             = var.vpc_id
  enable_eks_ci_role = var.enable_eks_ci_role
  ci_role_arn        = var.ci_role_arn
}
