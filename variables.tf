variable "webapp_vars" {
  description = "List of environment objects (env, sku, image, location override)"
  type = list(object({
    env          = string
    location     = string
    asp_sku      = string
    docker_image = string
  }))
}
