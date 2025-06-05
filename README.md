# 🚀 Terraform Docker DevOps Stack – Nginx + Prometheus + Grafana

A complete **local DevOps Monitoring Stack** built using **Terraform**, the **Docker provider**, and custom container resources. This project provisions:

- 📈 Prometheus for metrics collection  
- 📊 Grafana for visualization  
- 📡 Node Exporter for system metrics  
- 🌐 A custom Nginx web server for simulating a static web app

> ✅ Entire stack is provisioned using **Infrastructure as Code (IaC)** — no manual Docker CLI or Compose!

---

## 🛠️ Tools & Technologies

| Tool         | Purpose                        |
|--------------|--------------------------------|
| Terraform    | Infrastructure as Code         |
| Docker       | Containerization               |
| Nginx        | Static Web Server              |
| Prometheus   | Metrics collection             |
| Grafana      | Dashboards & Visualization     |
| Node Exporter| Host system metrics exporter   |

---

## 🧾 Project Structure

```bash
terraform-devops-stack/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── prometheus/
│   └── prometheus.yml
├── nginx/
│   ├── Dockerfile
│   └── index.html
├── grafana/
│   └── provisioning/
│       └── dashboards/   # Optional JSON dashboards
└── README.md
🚦 How It Works
Terraform provisions Docker images & containers with all configurations.

prometheus.yml is mounted inside the Prometheus container.

Grafana uses provisioning to auto-detect Prometheus as a data source.

Nginx serves a custom HTML file on port 8080.

Node Exporter runs on port 9100, monitored by Prometheus.

▶️ Getting Started
📦 Prerequisites
Docker installed and running

Terraform v1.6+ installed

VS Code (recommended)

🚀 Run the Stack
bash
कॉपी करें
बदलें
# Clone the repository
git clone https://github.com/your-username/terraform-devops-stack.git
cd terraform-devops-stack

# Initialize and apply Terraform
terraform init
terraform apply
🌐 Access the Services
Service	URL
🔍 Nginx	http://localhost:8080
📊 Grafana	http://localhost:3000
📈 Prometheus	http://localhost:9090
🛰 Node Exporter	http://localhost:9100/metrics

Grafana Login

Username: admin

Password: admin (default)

📸 Screenshots
🖥️ Custom Nginx Page
![image](https://github.com/user-attachments/assets/892d59ef-cfd7-4e58-9187-66afaf1f91cf)


📈 Prometheus UI
![image](https://github.com/user-attachments/assets/dc218978-a908-42d2-a9cd-4571e5226afb)


📊 Grafana Dashboard
![image](https://github.com/user-attachments/assets/d95ddd5d-117b-413c-93c0-191488842d1b)


📚 Learning Outcomes
Built a monitoring stack from scratch using only Terraform and Docker.

Practiced defining volumes, networks, and multi-container setup with IaC.

Understood how observability tools connect in a real-world scenario.

No use of Docker Compose or cloud—everything runs locally and is reproducible.

✅ Next Goals (Ideas to Extend)
Add Alertmanager for Prometheus.

Integrate a backend app (Flask/Node.js) instead of static Nginx.

Push this stack to a VM or cloud environment.

Auto-provision Grafana dashboards using JSON.

🙋‍♂️ Author
Sayed Mohsin Ali
👨‍💻 DevOps Engineer | 3.5 YOE | Azure | Terraform | Kubernetes
📍 LinkedIn
🌐 GitHub

💡 If this helped you, feel free to ⭐ the repo and connect with me!
