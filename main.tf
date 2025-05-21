module "ci_role" {
  source               = "./modules/ci_role"
  account_environment  = var.account_environment
  trusted_ci_role_arn  = var.trusted_ci_role_arn
  trusted_ci_role_arns = var.trusted_ci_role_arns
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
  state_bucket_arn   = module.state_bucket.s3_bucket_arn
}

module "github_actions_role" {
  source = "./modules/github_actions_role"

  github_organization = var.github_organization
  state_bucket_arn    = module.state_bucket.s3_bucket_arn
}
