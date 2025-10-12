output "webapp_url" {
  description = "URL of the web app"
  value       = azurerm_linux_web_app.this.default_site_hostname
}
