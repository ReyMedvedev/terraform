output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.public_subnets.*.id
}

output "security_group_id" {
  value = aws_security_group.main.id
}
