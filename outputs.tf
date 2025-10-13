output "webapp_url" {
  description = "URLs for all deployed environments"
  value       = { for k, m in module.webapp : k => m.webapp_url }
}
