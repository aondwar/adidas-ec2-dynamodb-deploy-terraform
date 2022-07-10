#output "instance_id" {
#  value = aws_instance.example.public_ip
#}

output "my_security_group" {
  value = aws_security_group.my_security_group.id
}

output "iamuserkeys" {
  value     = aws_iam_access_key.iamuserkeys
  sensitive = "true"
}

