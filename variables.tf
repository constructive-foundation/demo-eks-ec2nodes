variable "worker_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t2.small"
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "eks_cluster_ver" {
  description = "EKS cluster version"
  type        = string
  default     = "1.16"
}

variable "worker_nodes_desired" {
  description = "Desired worker nodes, should be less than max count of worker nodes in node group"
  type        = number
  default     = 1
}

variable "worker_nodes_min" {
  description = "minimum worker nodes in node group"
  type        = number
  default     = 1
}

variable "worker_nodes_max" {
  description = "maximum number of worker nodes in node group"
  type        = number
  default     = 1
}

variable "vpc_name" {
  description = "vpc name"
  type        = string
}

variable "nat_enable" {
  description = "flag to enable nat gateway"
  type        = bool
  default     = true
}

variable "single_nat_enable" {
  description = "flag to enable single nat gateway"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "flag to enable dns hostnames"
  type        = bool
  default     = true
}

variable "vpc_cidr" {
  description = "vpc cidr range"
  type        = string
}


variable "vpc_private_subnets" {
  description = "list of vpc private subnets"
  type        = list
}

variable "vpc_public_subnets" {
  description = "list of vpc public subnets"
  type        = list
}