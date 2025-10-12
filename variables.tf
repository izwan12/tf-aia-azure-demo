variable "webapp_vars" {
  description = "List of environment objects (env, sku, image, location override)"
  type = list(object({
    env          = string
    location     = string
    sku_name     = string
    docker_image = string
    os_type      = string
  }))
}
