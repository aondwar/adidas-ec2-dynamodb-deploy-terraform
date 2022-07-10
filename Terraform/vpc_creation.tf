### create vpc
resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc"
  }
}

### create subnet
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet"
  }
}

### create gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "main"
  }
}


### attache internet gateway with vpc
resource "aws_internet_gateway_attachment" "gatewayattached" {
  internet_gateway_id = aws_internet_gateway.gateway.id
  vpc_id              = aws_vpc.vpc.id
}


### create route table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id



  tags = {
    Name = "route_table"
  }
}

## make entries in route table
resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}
