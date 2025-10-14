output "webapp_url" {
  description = "URL of the web app"
  value       = { for k, m in module.webapp : k => m.webapp_url }
}
