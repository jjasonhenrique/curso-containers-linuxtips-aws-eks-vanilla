data "aws_iam_policy_document" "node_termination" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "node_termination" {
  assume_role_policy = data.aws_iam_policy_document.node_termination.json
  name               = format("%s-node-termination-handler", var.project_name)
}

data "aws_iam_policy_document" "aws_node_termination_handler_policy" {
  version = "2012-10-17"

  statement {

    effect = "Allow"
    actions = [
      "autoscaling:CompleteLifecycleAction",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeTags",
      "ec2:DescribeInstances",
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage"
    ]

    resources = [
      "*"
    ]

  }
}

resource "aws_iam_policy" "aws_node_termination_handler_policy" {
  name   = format("%s-node-termination-handler", var.project_name)
  policy = data.aws_iam_policy_document.aws_node_termination_handler_policy.json
}

resource "aws_iam_role_policy_attachment" "aws_node_termination_handler_policy" {
  role       = aws_iam_role.node_termination.name
  policy_arn = aws_iam_policy.aws_node_termination_handler_policy.arn
}