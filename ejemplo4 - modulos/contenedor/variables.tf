
variable "nombre_contenedor" {
    description = "Nombre del contenedor que voy a generar"
    type        = string
}

variable "puertos" {
    description = "Nombre de la imagen que voy a descargar"
    type        = list(map(string))
}

variable "nombre_imagen" {
    description = "Nombre de la imagen que voy a descargar"
    type        = string
}

variable "version_imagen" {
    description = "Versión de la imagen que voy a descargar"
    type        = string
    default     = "latest"
}