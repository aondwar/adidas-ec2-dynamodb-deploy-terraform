##Roles

resource "aws_iam_role" "assume_role" {
  name               = "ec2_role"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}




resource "aws_iam_role" "dynamodb_read_role" {
  name                = "read_role"
  path                = "/system/"
  managed_policy_arns = [aws_iam_policy.readpolicy.arn]
  assume_role_policy  = data.aws_iam_policy_document.instance-assume-role-policy.json

}



resource "aws_iam_role" "dynamodb_rwrite_role" {
  name                = "rwrite_role"
  path                = "/system/"
  managed_policy_arns = [aws_iam_policy.writepolicy.arn]
  assume_role_policy  = data.aws_iam_policy_document.instance-assume-role-policy.json


}





