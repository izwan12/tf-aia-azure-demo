output "webapp_url" {
  description = "URL of the web app"
  value       = "https://${azurerm_linux_web_app.this.name}.azurewebsites.net"
}
