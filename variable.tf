variable "my_aws_access_key" {
  description = "Please Fill Use Your AWS Access Key"
  type        = string
}

variable "my_aws_secret_key" {
  description = "Please Fill Use Your AWS Secret Key"
  type        = string
}

variable "my_default_region" {
  type = string
}

variable "my_environment" {
  type = string
}

variable "my_ami_id" {
  type = string
}

variable "my_ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "my_number_of_instances" {
  type    = number
}

variable "my_vpc_id" {
  type = string
}

variable "my_availability_zone" {
  type = list
}

variable "my_private_subnet_id" {
}

variable "my_public_subnet_id" {
}

variable "my_default_sg_id" {
  type = string
}
