## assume policy
data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2"]
    }

  }

  statement {

    actions   = ["iam:PassRole"]
    effect    = "Allow"
    resources = ["arn:aws:iam:var.region:*:role/dynamodb_read_role"]

  }
}
