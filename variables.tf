variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "addon_coredns_version" {
  type    = string
  default = "v1.11.4-eksbuild.2"
}

variable "addon_kubeproxy_version" {
  type    = string
  default = "v1.31.3-eksbuild.2"
}

variable "addon_cni_version" {
  type    = string
  default = "v1.19.2-eksbuild.1"
}

variable "ssm_vpc" {
  type = string
}

variable "ssm_public_subnets" {
  type = list(string)
}

variable "ssm_private_subnets" {
  type = list(string)
}

variable "ssm_pod_subnets" {
  type = list(string)
}

variable "auto_scale_options" {
  type = object({
    min     = number
    max     = number
    desired = number
  })
}

variable "nodes_instance_sizes" {
  type = list(string)
}

variable "custom_ami" {
  type        = string
  description = "AMI ID customizada para os nodes"
  default     = "ami-0181ca43ef1eba8ed"
}