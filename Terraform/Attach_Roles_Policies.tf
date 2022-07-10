##policies attachment with role
resource "aws_iam_policy_attachment" "read-policy-attach" {
  name       = "read-policy-attachment"
  users      = var.read_users
  roles      = [aws_iam_role.dynamodb_read_role.name]
  policy_arn = aws_iam_policy.readpolicy.arn
}

resource "aws_iam_policy_attachment" "admin-rw-policy-attach" {
  name       = "read-policy-attachment"
  users      = var.admin_users
  roles      = [aws_iam_role.dynamodb_read_role.name, aws_iam_role.dynamodb_rwrite_role.name]
  policy_arn = aws_iam_policy.writepolicy.arn
}

