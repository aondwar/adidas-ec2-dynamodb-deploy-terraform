##IAM
resource "aws_iam_user" "iam_users" {
  count = length(var.username)
  name  = element(var.username, count.index)
  path  = "/system/"
}


#Access Keys
resource "aws_iam_access_key" "iamuserkeys" {
  count = length(var.username)
  user  = element(var.username, count.index)
}