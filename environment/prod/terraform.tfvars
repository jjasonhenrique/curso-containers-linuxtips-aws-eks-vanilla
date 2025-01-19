project_name = "cluster-vanilla"

region = "us-east-1"

k8s_version = "1.31"

auto_scale_options = {
  min     = 1
  max     = 10
  desired = 1
}

nodes_instance_sizes = ["t3.large", "t3a.large"]

ssm_vpc = "/linuxtips-networking/vpc/id"

ssm_public_subnets = [
  "/linuxtips-networking/subnets/public/us-east-1a/linuxtips-public-1a",
  "/linuxtips-networking/subnets/public/us-east-1b/linuxtips-public-1b",
  "/linuxtips-networking/subnets/public/us-east-1c/linuxtips-public-1c"
]

ssm_private_subnets = [
  "/linuxtips-networking/subnets/private/us-east-1a/linuxtips-private-1a",
  "/linuxtips-networking/subnets/private/us-east-1b/linuxtips-private-1b",
  "/linuxtips-networking/subnets/private/us-east-1c/linuxtips-private-1c"
]

ssm_pod_subnets = [
  "/linuxtips-networking/subnets/private/us-east-1a/linuxtips-pods-1a",
  "/linuxtips-networking/subnets/private/us-east-1b/linuxtips-pods-1b",
  "/linuxtips-networking/subnets/private/us-east-1c/linuxtips-pods-1c"
]