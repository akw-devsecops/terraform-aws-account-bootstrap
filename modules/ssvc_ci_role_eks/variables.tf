variable "vpc_id" {
  type = string
}

variable "enable_eks_ci_role" {
  type = bool
  default = false
}

variable "state_bucket_arn" {
  type = string
}