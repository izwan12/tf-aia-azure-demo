variable "env" {
  type = string
}


variable "location" {
  type = string
}


variable "name_prefix" {
  type = string
}


variable "docker_image" {
  type    = string
  default = "httpd:2.4"
}


variable "asp_sku" {
  type    = string
  default = "B1"
}
