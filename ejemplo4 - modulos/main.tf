terraform {
    required_providers {
        docker = {
            #  He actualizado el repo del provider de docker
            source = "kreuzwerker/docker"
        }
    }
}


module "nginx" {
    source  = "./contenedor"
    nombre_imagen = "nginx"
    nombre_contenedor = "mi-nginx"
}
