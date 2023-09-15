terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {}

## VPC start ###
resource "aws_security_group" "my_sg" {
  name        = "my-sg"
  description = "My Security Group"
}

resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.my_ip
  security_group_id = aws_security_group.my_sg.id
}

resource "aws_security_group_rule" "allow_internet" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "all"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id
}
## VPC end ###

## EC2 start ##
resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("C:/Users/admin/.ssh/id_rsa.pub")
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b9094fa2b07038b8"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name

  security_groups = [aws_security_group.my_sg.name]

  tags = {
    Name = "MyInstance"
  }
}
## EC2 end ###


