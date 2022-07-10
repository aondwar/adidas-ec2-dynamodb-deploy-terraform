variable "app_name" {
  default = "adidas"
}

variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0d57c0143330e1fa7"
}

variable "instance_type" {
  default = "t2.micro"
}



variable "vpc_id" {
  default = "vpc-bc102dc46"
}

variable "port" {
  default = 22
}

variable "cidr_block" {
  default = "0.0.0.0/0"
}

variable "sgid" {
  default = "sg-be8b278a"
}

##IAM users
variable "username" {
  type    = list(any)
  default = ["Aparna", "Amit", "Atharva"]

}


variable "table_name" {
  default = "adidas_assignment"
}

variable "read_users" {
  type    = list(any)
  default = ["Amit", "Atharva"]
}

variable "admin_users" {
  type    = list(any)
  default = ["Aparna"]
}