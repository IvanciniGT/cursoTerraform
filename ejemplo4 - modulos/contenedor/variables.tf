
variable "nombre_imagen" {
    description = "Nombre de la imagen que voy a descargar"
    type        = string
}

variable "version_imagen" {
    description = "Versión de la imagen que voy a descargar"
    type        = string
    default     = "latest"
}