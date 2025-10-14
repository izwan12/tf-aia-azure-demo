resource "azurerm_resource_group" "this" {
  name     = "${var.env}-${var.name_prefix}-rg"
  location = var.location
}

resource "azurerm_service_plan" "this" {
  name                = "${var.env}-${var.name_prefix}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "this" {
  name                = "${var.env}-${var.name_prefix}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  service_plan_id     = azurerm_service_plan.this.id

  site_config {
    application_stack {
      docker_image_name   = var.docker_image
      docker_registry_url = var.docker_registry
    }
    always_on = false
  }

  app_settings = {
    "ENVIRONMENT"                         = var.env
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
    "STARTUP_COMMAND"                     = "/home/site/startup.sh"
  }
}
