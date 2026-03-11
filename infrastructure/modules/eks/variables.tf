variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "environment" {
  type = string
}

variable "admin_user_arn" {
  description = "IAM user or role with cluster admin access"
  type        = string
}