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
  type = string
  default = "v1.11.3-eksbuild.1" 
}

variable "addon_kubeproxy_version" {
  type = string
  default = "v1.31.2-eksbuild.3"
}

variable "addon_cni_version" {
  type = string
  default = "v1.18.3-eksbuild.2" 
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