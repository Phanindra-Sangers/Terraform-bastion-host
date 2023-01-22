variable "count_value" {
  type        = number
  default     = 2
  description = "no.of ec2 instances to provision"
}

variable "instance-type" {

  type        = string
  default     = "t2.micro"
  description = "Type of the Instance to provision"

}

variable "vpc_CIDR_Block" {

  type    = string
  default = "10.0.0.0/16"

}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24"]
}

variable "pub_availability_zones" {
  default = ["ap-south-1a"]
}

variable "pvt_availability_zones" {
  default = ["ap-south-1b"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.2.0/24"]
}
