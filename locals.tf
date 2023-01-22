locals {

  name = "Bastion VPC"

  aws_internet_gateway_tags = {

    name = "igw"
    env  = "bastion-env"
  }


  nacl-tags = {

    name = "private-NACL"

  }
}