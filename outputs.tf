output "webapp_url" {
  description = "URLs for all deployed environments"
  value       = { for k, m in module.webapps : k => m.app_url }
}
