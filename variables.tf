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
  type = bool
  default = true
}

variable "enable_eks_ci_config_role" {
  type = bool
  default = true
}

variable "trusted_ci_role_arn" {
  type = string
}