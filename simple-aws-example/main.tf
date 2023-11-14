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
  name        = "Ansible"
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

resource "aws_security_group_rule" "allow_bd" {
  type        = "ingress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id
}

resource "aws_security_group_rule" "allow_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
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

## EC2 APP start ##
resource "aws_key_pair" "ansible_app" {
  key_name   = "ansible-app"
  public_key = file("./keys/ansible-app.pub")
}

resource "aws_instance" "app_server" {
  ami           = "ami-06dd92ecc74fdfb36"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ansible_app.key_name

  security_groups = [aws_security_group.my_sg.name]

  tags = {
    Name = "Ansible-APP-Server"
  }
}
## EC2 APP end ###

## EC2 DB start ##
resource "aws_key_pair" "ansible_db" {
  key_name   = "ansible-db"
  public_key = file("./keys/ansible-db.pub")
}

resource "aws_instance" "db_server" {
  ami           = "ami-06dd92ecc74fdfb36"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ansible_db.key_name

  security_groups = [aws_security_group.my_sg.name]

  tags = {
    Name = "Ansible-DB-Server"
  }
}
## EC2 DB end ###


