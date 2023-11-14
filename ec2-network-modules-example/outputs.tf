output "public_ip" {
  value = module.ec2_instance.instance_public_ip
}