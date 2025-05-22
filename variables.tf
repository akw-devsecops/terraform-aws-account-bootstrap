variable "project_name" {
  type = string
}

variable "account_environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "enable_eks_ci_role" {
  type    = bool
  default = true
}

variable "enable_eks_ci_config_role" {
  type    = bool
  default = true
}

variable "trusted_ci_role_arn" {
  type = string
}

variable "trusted_ci_role_arns" {
  type    = set(string)
  default = []
}

variable "github_organization" {
  type        = string
  description = "GitHub organization name for OIDC provider"
}

variable "github_repository" {
  type        = string
  description = "GitHub repository name for OIDC provider"
}
