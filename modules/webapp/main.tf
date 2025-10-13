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

    app_command_line = "/bin/sh -c 'mkdir -p /home/site/wwwroot && printf \"This is ${var.env} environment.\" > /home/site/wwwroot/index.html && rm -rf /usr/local/apache2/htdocs/* && ln -s /home/site/wwwroot /usr/local/apache2/htdocs && exec httpd-foreground'"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
  }
}
