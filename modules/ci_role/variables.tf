variable "account_environment" {
  type = string
}

variable "trusted_ci_role_arn" {
  type = string
}

variable "trusted_ci_role_arns" {
  type    = set(string)
  default = []
}
