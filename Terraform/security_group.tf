## creation of basic security group 
resource "aws_security_group" "my_security_group" {
  name = "allow_everybody"
  ingress {
    description = "Allow inbound ssh traffic"
    cidr_blocks = [var.cidr_block]
    from_port   = var.port
    protocol    = "tcp"
    to_port     = var.port
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    name = "allow_sshs"
  }
}
