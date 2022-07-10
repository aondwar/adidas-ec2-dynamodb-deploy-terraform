## IAM policies
## DynamodDB access policies

data "aws_iam_policy_document" "dynamodb-read-policy" {

  statement {
    actions   = ["dynamodb:DescribeTable", "dynamodb:GetItem", "dynamodb:BatchGetItem", "dynamodb:Scan", "dynamodb:Query", "dynamodb:ConditionCheckItem"]
    effect    = "Allow"
    resources = ["arn:aws:dynamodb:${var.region}:*:table/${var.table_name}"]

  }


}

data "aws_iam_policy_document" "dynamodb-rwrite-policy" {

  statement {
    actions = ["dynamodb:DeleteItem",
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:BatchGetItem",
      "dynamodb:GetRecords",
      "dynamodb:ListTables",
      "dynamodb:PutItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:UpdateItem",
      "dynamodb:UpdateTable",
    "dynamodb:ConditionCheckItem"]
    effect    = "Allow"
    resources = ["arn:aws:dynamodb:${var.region}:*:table/${var.table_name}"]

  }

}


resource "aws_iam_policy" "readpolicy" {
  name   = "${var.app_name}-${var.region}-DynamoDb-Read-Policy"
  policy = data.aws_iam_policy_document.dynamodb-read-policy.json
}


resource "aws_iam_policy" "writepolicy" {
  name   = "${var.app_name}-${var.region}-DynamoDb-Write-Policy"
  policy = data.aws_iam_policy_document.dynamodb-rwrite-policy.json
}