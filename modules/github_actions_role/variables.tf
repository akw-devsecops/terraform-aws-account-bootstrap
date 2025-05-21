variable "github_organization" {
  description = "GitHub organization name for OIDC provider"
  type        = string
}

variable "state_bucket_arn" {
  description = "ARN of the state bucket"
  type        = string
}
