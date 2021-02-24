provider "aws" {
  access_key = var.my_aws_access_key
  secret_key = var.my_aws_secret_key
  region     = var.my_default_region
}

module "basic_ec2" {
  source = "../../modules/multiple_ec2"

  ec2_count             = var.my_number_of_instances
  ec2_environment       = var.my_environment
  ec2_ami_id            = var.my_ami_id
  ec2_instance_type     = var.my_ec2_type
  ec2_vpc_id            = var.my_vpc_id
  ec2_private_subnet_id = var.my_private_subnet_id
  ec2_public_subnet_id  = var.my_public_subnet_id
  ec2_default_sg_id     = var.my_default_sg_id
  ec2_availability_zone = var.my_availability_zone
}
