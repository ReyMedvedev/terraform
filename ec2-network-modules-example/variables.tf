variable "region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "project" {
  description = "The project name."
  type        = string
}

variable "environment" {
  description = "The environment to deploy to."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of public subnet CIDRs."
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones in the region."
  type        = list(string)
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
}

variable "ami" {
  description = "The AMI to use for the EC2 instance."
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for the instance."
  type        = string
}

variable "volume_size" {
  description = "The size of the volume to attach to the instance."
  type        = number
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
}