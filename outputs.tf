output "nginx_url" {
  value       = "http://localhost:${var.nginx_host_port}"
  description = "Access Nginx app"
}

output "grafana_url" {
  value       = "http://localhost:${var.grafana_port}"
  description = "Access Grafana dashboard"
}

output "prometheus_url" {
  value       = "http://localhost:${var.prometheus_port}"
  description = "Access Prometheus metrics"
}

output "node_exporter_url" {
  value       = "http://localhost:${var.node_exporter_port}"
  description = "Access Node Exporter metrics"
}
