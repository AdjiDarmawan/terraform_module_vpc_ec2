resource "aws_vpc" "this" {
  cidr_block           = var.vpc_default_cidr
  instance_tenancy     = var.vpc_instances_tenancy
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support

  tags = {
    Name        = "vpc_${var.vpc_environment}"
    Environment = var.vpc_environment
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.vpc_avaialable_zone)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.vpc_private_subnet,count.index)
  availability_zone = var.vpc_avaialable_zone[count.index]

  tags = {
    Name        = "private_subnet_v${count.index+1}"
    Environment = var.vpc_environment
  }
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.vpc_avaialable_zone)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.vpc_public_subnet,count.index)
  availability_zone = var.vpc_avaialable_zone[count.index]

  tags = {
    Name        = "public_subnet_v${count.index+1}"
    Environment = var.vpc_environment
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.vpc_environment}-igw"
    Environment = var.vpc_environment
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.vpc_environment}-public_rt"
  }
}

resource "aws_default_route_table" "private_rt" {
  default_route_table_id = aws_vpc.this.default_route_table_id

  tags = {
    Name        = "${var.vpc_environment}-private_rt"
    Environment = var.vpc_environment
  }
}

resource "aws_route_table_association" "public_route_table_assoc" {
  count          = length(var.vpc_public_subnet)
  route_table_id = element(aws_route_table.public_route_table.*.id,count.index)
  subnet_id      = element(aws_subnet.public_subnet.*.id,count.index)
}

resource "aws_route_table_association" "private_route_table_assoc" {
  count          = length(var.vpc_private_subnet)
  route_table_id = element(aws_default_route_table.private_rt.*.id,count.index)
  subnet_id      = element(aws_subnet.private_subnet.*.id,count.index)
}

resource "aws_security_group" "default_ec2_sg" {
  name   = "${var.vpc_environment}-default_sg"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.vpc_environment}-default_sg"
    Environment = var.vpc_environment
  }
}
