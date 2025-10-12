module "webapps" {
  for_each = { for webapp in var.webapp_vars : webapp.env => webapp }

  source       = "./modules/webapp"
  name_prefix  = local.name_prefix
  env          = each.value.env
  location     = each.value.location
  asp_sku      = each.value.asp_sku
  docker_image = each.value.docker_image
}
