resource "kubernetes_manifest" "ec2_node_class" {
  count = length(var.karpenter_capacity)
  manifest = {
    apiVersion = "karpenter.k8s.aws/v1"
    kind       = "EC2NodeClass"
    metadata = {
      name = var.karpenter_capacity[count.index].name
    }
    spec = {
      instanceProfile = aws_iam_instance_profile.nodes.name
      amiFamily       = var.karpenter_capacity[count.index].ami_family
      amiSelectorTerms = [{
        id = data.aws_ssm_parameter.karpenter_ami[count.index].value
      }]
      securityGroupSelectorTerms = [{
        id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
      }]
      subnetSelectorTerms = [
        for subnet in data.aws_ssm_parameter.pod_subnets[*].value : { id = subnet }
      ]
    }
  }
  depends_on = [ 
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    helm_release.karpenter
  ]
}

resource "kubernetes_manifest" "node_pool" {
  count = length(var.karpenter_capacity)
  manifest = {
    apiVersion = "karpenter.sh/v1"
    kind       = "NodePool"
    metadata = {
      name = var.karpenter_capacity[count.index].name
    }
    spec = {
      disruption = {
        consolidationPolicy = "WhenEmptyOrUnderutilized"
        consolidateAfter    = "1m"
      }
      template = {
        metadata = {
          labels = {
            workload = var.karpenter_capacity[count.index].workload
          }
        }
        spec = {
          requirements = [
            {
              key      = "karpenter.k8s.aws/instance-family"
              operator = "In"
              values   = var.karpenter_capacity[count.index].instance_family
            },
            {
              key      = "karpenter.sh/capacity-type"
              operator = "In"
              values   = var.karpenter_capacity[count.index].capacity_type
            },
            {
              key      = "karpenter.k8s.aws/instance-size"
              operator = "In"
              values   = var.karpenter_capacity[count.index].instance_sizes
            },
            {
              key      = "topology.kubernetes.io/zone"
              operator = "In"
              values   = var.karpenter_capacity[count.index].availability_zones
            }
          ]
          nodeClassRef = {
            group = "karpenter.k8s.aws"
            kind  = "EC2NodeClass"
            name  = var.karpenter_capacity[count.index].name
          }
        }
      }
    }
  }
  depends_on = [ 
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    helm_release.karpenter
  ]
}
