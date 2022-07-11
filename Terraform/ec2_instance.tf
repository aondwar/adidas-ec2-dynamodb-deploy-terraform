# ec2 instance
resource "aws_instance" "ec2-instance" {
  region                  = var.region
  ami                     = var.ami_id
  instance_type           = var.instance_type
  disable_api_stop        = true
  disable_api_termination = true
  vpc_security_group_ids  = [aws_security_group.my_security_group.id]
}
