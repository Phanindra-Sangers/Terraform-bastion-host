resource "aws_network_acl" "main" {


  vpc_id = aws_vpc.bastion-vpc.id

  subnet_ids = aws_subnet.private[0].id


  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80 #http port 80
  }


  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443 #https port 443 
    to_port    = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.public_subnet_cidrs
    from_port  = 32768
    to_port    = 61000
  }

  ingress {
    protocol   = "ssh"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.public_subnet_cidrs
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    name = local.nacl-tags.name
  }
}