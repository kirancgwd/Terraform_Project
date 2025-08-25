variable "cluster_role_name" {
  description = "Name of the EKS cluster IAM role"
  type        = string
}

variable "cluster_assume_role_policy" {
  description = "Assume role policy for the EKS cluster"
  type        = string
}

variable "node_group_role_name" {
  description = "Name of the EKS node group IAM role"
  type        = string
}

variable "node_group_assume_role_policy" {
  description = "Assume role policy for the EKS node group"
  type        = string
}
