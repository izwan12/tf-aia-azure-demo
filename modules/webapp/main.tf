# Resource Group
resource "azurerm_resource_group" "this" {
  name     = "${var.name_prefix}-${var.env}-rg"
  location = var.location
}

# App Service Plan
resource "azurerm_app_service_plan" "this" {
  name                = "${var.name_prefix}-${var.env}-asp"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "Linux"

  reserved = true

  sku {
    tier = contains(["B1", "B2", "B3"], var.asp_sku) ? "Basic" : (starts_with(var.asp_sku, "P") ? "PremiumV2" : "Standard")
    size = var.asp_sku
  }
}

# Linux Web App (container)
resource "azurerm_linux_web_app" "this" {
  name                = "${var.name_prefix}-${var.env}-app"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  service_plan_id     = azurerm_app_service_plan.this.id

  site_config {
    # Use Docker image
    linux_fx_version = "DOCKER|${var.docker_image}"

    # Startup command writes the index and launches Apache
    app_command_line = "/bin/sh -lc \"echo 'This is ${var.env} environment.' > /usr/local/apache2/htdocs/index.html && httpd-foreground\""

    always_on = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}
