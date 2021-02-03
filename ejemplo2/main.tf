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
resource "docker_container" "contenedor-nginx-solo" {
  name  = "mi_contenedor_nginx"
  image = docker_image.imagen-nginx.latest
  ports {
    internal = 80
    external = 8085
  }
}

resource "docker_container" "contenedores-nginx-iguales" {
  count = 3
  name  = "mi_contenedor_nginx_${count.index}"
  image = docker_image.imagen-nginx.latest
  ports {
    internal = 80
    external = 8080 + count.index
  }
}

resource "docker_container" "contenedores-nginx-diferentes" {
  for_each = var.contenedores
  # La variable each me da: each.key y un each.value
  name  = each.key
  image = docker_image.imagen-nginx.latest
  ports {
    internal = 80
    external = each.value 
  }
}

resource "docker_container" "contenedores-nginx-diferentes-nombres" {
  for_each = toset(var.nombre_contenedores)
  # La variable each me da: each.key y un each.value
  name  = each.key
  image = docker_image.imagen-nginx.latest
}

resource "docker_image" "imagen-nginx" {
  name = "${var.nombre_imagen}:${var.version_imagen}"
}

