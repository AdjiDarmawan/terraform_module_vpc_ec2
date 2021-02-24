output "my_vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.*.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.*.id
}
