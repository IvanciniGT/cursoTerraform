terraform {
    required_providers {
        docker = {
            #  He actualizado el repo del provider de docker
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" { }
/*
    Me estoy creando un contenedor
*/
resource "docker_container" "contenedor" {
  name  = var.nombre_contenedor
  image = docker_image.imagen.latest
}

         #docker_image.  imagen.
resource "docker_image" "imagen" {
  name = "${var.nombre_imagen}:${var.version_imagen}"
}
