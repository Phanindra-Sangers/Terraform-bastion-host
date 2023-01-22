resource "aws_instance" "pub-example" {
  count                  = 1
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance-type
  vpc_security_group_ids = [aws_security_group.public-ec2example.id]
  subnet_id              = aws_subnet.public[count.index].id
  key_name               = "bastion"
  tags = {
    Name = "bastion-host-instance-${count.index}"
  }
}


resource "aws_instance" "pvt-example" {
  count         = 1
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance-type
  subnet_id     = aws_subnet.private[count.index].id
  key_name      = "bastion"
  tags = {
    Name = "bastion-host-instance-${count.index}"
  }
}




