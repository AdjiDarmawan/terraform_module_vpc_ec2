variable "ec2_environment" {
}

variable "ec2_ami_id" {
  type = string
}

variable "ec2_instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_count" {
  type = number
}

variable "ec2_vpc_id" {
}

variable "ec2_availability_zone" {
  type = list
}

variable "ec2_private_subnet_id" {
  type    = list
}

variable "ec2_public_subnet_id" {
  type = list
}

variable "ec2_default_sg_id" {
}
