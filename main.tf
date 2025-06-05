terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.20.0"
    }
  }
}

provider "docker" {}

# --------------------------
# Docker Network
# --------------------------
resource "docker_network" "devops_net" {
  name = "devops_network"
}

# --------------------------
# Node Exporter
# --------------------------
resource "docker_image" "node_exporter" {
  name = "prom/node-exporter"
}

resource "docker_container" "node_exporter" {
  name  = "node_exporter"
  image = docker_image.node_exporter.name

  ports {
    internal = var.node_exporter_port
    external = var.node_exporter_port
  }

  networks_advanced {
    name = docker_network.devops_net.name
  }
}

# --------------------------
# Prometheus
# --------------------------
resource "docker_image" "prometheus" {
  name = "prom/prometheus"
}

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.name

  ports {
    internal = var.prometheus_port
    external = var.prometheus_port
  }

  volumes {
    host_path      = abspath("${path.module}/prometheus/prometheus.yml")
    container_path = "/etc/prometheus/prometheus.yml"
  }

  networks_advanced {
    name = docker_network.devops_net.name
  }

  depends_on = [docker_container.node_exporter]
}

# --------------------------
# Grafana
# --------------------------
resource "docker_image" "grafana" {
  name = "grafana/grafana"
}

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.name

  ports {
    internal = var.grafana_port
    external = var.grafana_port
  }

  volumes {
    host_path      = abspath("${path.module}/grafana/provisioning")
    container_path = "/etc/grafana/provisioning"
  }

  networks_advanced {
    name = docker_network.devops_net.name
  }

  depends_on = [docker_container.prometheus]
}

# --------------------------
# Custom Nginx
# --------------------------
resource "docker_image" "custom_nginx" {
  name = "custom-nginx"

  build {
    path = "${path.module}/nginx"
  }
}

resource "docker_container" "nginx" {
  name  = var.nginx_container_name
  image = docker_image.custom_nginx.name

  ports {
    internal = var.nginx_internal_port
    external = var.nginx_host_port
  }

  networks_advanced {
    name = docker_network.devops_net.name
  }

  depends_on = [docker_image.custom_nginx]
}
