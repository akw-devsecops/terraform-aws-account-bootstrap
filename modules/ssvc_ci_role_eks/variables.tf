variable "ci_role_arn" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "enable_eks_ci_role" {
  type = bool
  default = false
}