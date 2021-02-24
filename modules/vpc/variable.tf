variable "vpc_environment" {
  type = string
}

variable "vpc_id" {
}

variable "vpc_default_cidr" {
}

variable "vpc_avaialable_zone" {
  type    = list
}

variable "vpc_private_subnet" {
  type    = list
}

variable "vpc_public_subnet" {
  type    = list
}

variable "vpc_instances_tenancy" {
  default = "default"
}

variable "vpc_enable_dns_hostnames" {
  default = true
}

variable "vpc_enable_dns_support" {
  default = true
}
