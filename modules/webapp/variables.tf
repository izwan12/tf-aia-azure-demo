variable "env" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "name_prefix" {
  type    = string
  default = "demo"
}

variable "docker_image" {
  type    = string
  default = "httpd:latest"
}

variable "sku_name" {
  type    = string
  default = "B1"
}

variable "os_type" {
  type    = string
  default = "Linux"
}
