
variable "nombre_imagen" {
    description = "Nombre de la imagen que voy a descargar"
    type        = string
    default     = "nginx"
}

variable "version_imagen" {
    description = "Versión de la imagen que voy a descargar"
    type        = string
    default     = "latest"
}

variable "nombre_contenedores" {
    description = "Contendores nginx"
    type        = map(string)
    default     = {
        contenedorA  = "8090"
        contenedorB  = "8091"
    }
}
#variable "contenedores" {
#    description = "Contendores nginx"
#    type        = list(map(string))
#    default     = [
#        {
#            nombre      = "contenedorA"
#            puerto      = "8090"
#        },
#        {
#            nombre      = "contenedorB"
#            puerto      = "8091"
#        }
#    ]
}