
terraform {
    required_providers {
        aws = {
            source ="hashicorp/aws"
        }
    }
}

provider "aws" {
    profile = "default"
    region = "eu-west-1"
}


resource "aws_instance" "example" {
    ami = "ami-0176d5cc50152c509"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.example.name]
    key_name        = aws_key_pair.generated_key.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install docker -y",
      "docker run -d -p 8080:80 nginx",
    ]

    connection {
      host        = aws_instance.example.public_ip
      type        = "ssh"
      private_key = tls_private_key.example.private_key_pem
      user        = "ubuntu"
      timeout     = "1m"
    }
  }
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "example_key_pair"
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_security_group" "example" {
  name        = "grant ssh"
  description = "grant ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}