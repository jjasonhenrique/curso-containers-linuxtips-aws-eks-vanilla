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
  default = "v1.11.3-eksbuild.1"
}

variable "addon_kubeproxy_version" {
  type    = string
  default = "v1.31.2-eksbuild.3"
}

variable "addon_cni_version" {
  type    = string
  default = "v1.18.3-eksbuild.2"
}

variable "addon_pod_identity_version" {
  type    = string
  default = "v1.3.4-eksbuild.1"
}

variable "addon_efs_csi_version" {
  type    = string
  default = "v2.1.4-eksbuild.1"
}

variable "grafana_host" {
  type    = string
  default = ""
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

variable "istio_version" {
  type = string
  description = "Versao do Istio"
  default = "1.25.0"
}

variable "istio_min_replicas" {
  type = string
  description = ""
  default = "3"
}

variable "istio_max_replicas" {
  type = string
  description = ""
  default = "10"
}

variable "istio_cpu_threshold" {
  type = string
  description = ""
  default = "60"  
}

variable "jaeger_host" {
  type = string
  description = ""
  default = "jaeger.jjasonhenrique.com"
}

variable "kiali_host" {
  type = string
  description = ""
  default = "kiali.jjasonhenrique.com"
}

variable "kiali_version" {
  type = string
  description = ""
  default = "2.5"
}

variable "keda_version" {
  type = string
  description = ""
  default = "2.16.0"
}

variable "karpenter_capacity" {
  type = list(object({
    name               = string
    workload           = string
    ami_family         = string
    ami_ssm            = string
    instance_family    = list(string)
    instance_sizes     = list(string)
    capacity_type      = list(string)
    availability_zones = list(string)

  }))
}