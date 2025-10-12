output "environment_urls" {
  description = "URLs for all deployed environments"
  value       = { for k, m in module.webapps : k => m.app_url }
}
