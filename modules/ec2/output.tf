output "info_instances_id" {
  value = aws_instance.basic_ec2.*.id
}
