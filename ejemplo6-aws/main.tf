
terraform {
    required_providers {
        aws = {
            source ="hashicorp/aws"
        }
    }
}

provider "aws" {
    profile = "default"
    region  = "eu-west-1"
}


resource "aws_instance" "mi-maquina" {
    ami           = "ami-0176d5cc50152c509"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.mis_claves.key_name # Se genera la relacion de dependencia
#    key_name      = "claves_instancia_ivan"          # NO se genera la relacion de dependencia
    tags          = {
        Name      = "Instancia_Ivan"
    }
}

# Conectar ssh
    # usuario / contraseña (clave publica/privada)
    
resource "tls_private_key" "mi_clave_privada" {
  algorithm   = "RSA"
  rsa_bits    = 4096 
}

resource "aws_key_pair" "mis_claves" {
  key_name   = "claves_instancia_ivan"
  public_key = tls_private_key.mi_clave_privada.public_key_openssh
}

