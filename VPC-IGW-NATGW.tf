resource "aws_vpc" "bastion-vpc" {


  cidr_block = var.vpc_CIDR_Block #  "10.0.0.0/16"


  tags = {
    Name = local.name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.bastion-vpc.id

  tags = {
    name = local.aws_internet_gateway_tags.name
    env  = local.aws_internet_gateway_tags.env

  }
}


resource "aws_nat_gateway" "public-subnet" {
  count         = 1
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.public[count.index].id
}

resource "aws_eip" "example" {
  vpc = true
}

