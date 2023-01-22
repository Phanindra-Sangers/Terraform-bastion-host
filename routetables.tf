resource "aws_route_table" "public" {
  vpc_id = aws_vpc.bastion-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public-subnet-association" {


  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.public.id
  #gateway_id =  aws_internet_gateway.igw.id

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.bastion-vpc.id


  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public-subnet[0].id
  }
}

resource "aws_route_table_association" "private-subnet-association" {


  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.private.id

}



