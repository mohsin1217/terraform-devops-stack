variable "nginx_container_name" {
  type        = string
  default     = "custom_nginx"
  description = "Name of the custom nginx container"
}

variable "nginx_host_port" {
  type        = number
  default     = 8080
  description = "Port to access Nginx on host machine"
}

variable "nginx_internal_port" {
  type        = number
  default     = 80
  description = "Port inside nginx container"
}

variable "grafana_port" {
  type        = number
  default     = 3000
  description = "Grafana UI port"
}

variable "prometheus_port" {
  type        = number
  default     = 9090
  description = "Prometheus web port"
}

variable "node_exporter_port" {
  type        = number
  default     = 9100
  description = "Node exporter metrics port"
}
