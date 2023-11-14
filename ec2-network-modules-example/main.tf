provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "medvedev-terraform-state-backend"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform_state"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.62"
    }
  }
}

module "network" {
  source              = "./modules/network"
  region              = var.region
  project             = var.project
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  allowed_ports       = var.allowed_ports
}

module "ec2_instance" {
  source                    = "./modules/ec2"
  region                    = var.region
  project                   = var.project
  environment               = var.environment
  instance_type             = var.instance_type
  ami                       = var.ami
  key_name                  = var.key_name
  volume_size               = var.volume_size
  subnet_id                 = module.network.subnet_ids[0]
  vpc_security_group_ids    = [module.network.security_group_id]
}
