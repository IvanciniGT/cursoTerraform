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
resource "docker_container" "contenedor-ubuntu" {
  name  = "mi_contenedor_ubuntu"
  image = docker_image.imagen-ubuntu.latest
}
/*
2 volumenes dentro del contenedor:
HOST
/home/ubuntu/environment/cursoTerraform     >     /cursoTerraform
/home/ubuntu/environment/ivan               >     /ivan
*/


resource "docker_image" "imagen-ubuntu" {
//  OJO, tomo el último UBUNTU ¿?
#  name = "ubuntu:21.04"
#  name = var.nombre_imagen
  name = "${var.nombre_imagen}:${var.version_imagen}"
}
