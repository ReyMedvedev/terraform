region              = "eu-central-1"
project             = "projectname"
environment         = "dev"

vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
availability_zones  = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
allowed_ports       = ["80", "443", "22", "8080"]

instance_type       = "t2.micro"
ami                 = "ami-0a485299eeb98b979"
key_name            = "my-key"
volume_size         = 8
