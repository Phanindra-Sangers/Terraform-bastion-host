resource "aws_security_group" "public-ec2example" {
  name        = "public-ec2-instance-sg"
  description = "Example security group"
  vpc_id      = aws_vpc.bastion-vpc.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "pvt-example" {
  name        = "example"
  description = "Example security group"
}

resource "aws_security_group_rule" "pvt-example_ingress" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.pvt-example.id
  source_security_group_id = aws_security_group.public-ec2example.id
}





