resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              yum -y update
              yum -y install httpd
              echo "<h2>WebServer</h2><br>Build by Terraform!"  >  /var/www/html/index.html
              sudo service httpd start
              chkconfig httpd on
              EOF

  tags = {
    Name = "${var.project}-${var.environment}-instance"
  }
}

resource "aws_key_pair" "auth" {
  key_name   = var.key_name
  public_key = file("./keys/${var.key_name}.pub")
}

resource "aws_ebs_volume" "main" {
  availability_zone = aws_instance.main.availability_zone
  size              = var.volume_size

  tags = {
    Name = "${var.project}-${var.environment}-add-volume"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.main.id
  instance_id = aws_instance.main.id

}

