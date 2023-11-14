variable "region" {
  description = "The region where AWS resources will be created"
}

variable "project" {
  description = "The name of project"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, stage, prod)"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
}

variable "ami" {
  description = "The AMI to use for the EC2 instance"
}

variable "key_name" {
  description = "The key name of the SSH key pair to attach to the instance"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
}

variable "volume_size" {
  description = "The size of the additional EBS volume in GiBs"
}

variable "vpc_security_group_ids" {
  description = ""
}