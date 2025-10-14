variable "webapp_vars" {
  description = "List of webapp variables"
  type = list(object({
    env          = string
    location     = string
    sku_name     = string
    docker_image = string
    os_type      = string
  }))
}
