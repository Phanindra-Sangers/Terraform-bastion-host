resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.bastion-vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.pub_availability_zones[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.bastion-vpc.id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = var.pvt_availability_zones[count.index]
  map_public_ip_on_launch = false

}



