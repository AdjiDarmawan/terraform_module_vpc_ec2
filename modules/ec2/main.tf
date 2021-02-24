resource "aws_instance" "basic_ec2" {
  count         = var.ec2_count
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  subnet_id     = var.ec2_private_subnet_id[count.index]
  # availability_zone = var.ec2_availability_zone

  tags = {
    Name        = "${var.ec2_environment}_demo_ec2-${count.index+1}"
    Environment = var.ec2_environment
  }
}

# ini Module ec2
