module "webapp" {
  for_each = { for webapp in var.webapp_vars : webapp.env => webapp }

  source       = "./modules/webapp"
  name_prefix  = local.name_prefix
  env          = each.value.env
  location     = each.value.location
  sku_name     = each.value.asp_sku
  os_type      = each.value.os_type
  docker_image = each.value.docker_image
}
