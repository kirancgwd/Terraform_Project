variable "name" {
  description = "Environment or label name for tagging"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS worker nodes"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC for the EKS cluster"
  type        = string
}
