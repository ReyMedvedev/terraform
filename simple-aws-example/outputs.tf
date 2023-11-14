output "instance_app_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_db_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.db_server.id
}

output "instance_app_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_db_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.db_server.public_ip
}