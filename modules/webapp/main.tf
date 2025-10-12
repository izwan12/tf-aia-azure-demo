resource "azurerm_resource_group" "this" {
  name     = "${var.name_prefix}-${var.env}-rg"
  location = var.location
}

resource "azurerm_service_plan" "this" {
  name                = var.env + "-" + var.name_prefix
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "this" {
  name                = "${var.name_prefix}-${var.env}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  service_plan_id     = azurerm_service_plan.this.id

  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}"

    app_command_line = "/bin/sh -lc \"echo 'This is ${var.env} environment.' > /usr/local/apache2/htdocs/index.html && httpd-foreground\""

    always_on = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}
