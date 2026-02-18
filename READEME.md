# Azure NGINX Deployment using Terraform

This project provisions Azure infrastructure using Terraform and automatically installs NGINX on a Linux VM.

## Architecture

- Resource Group
- Virtual Network
- Subnet
- Network Security Group (Ports 22 & 80)
- Public IP (Standard SKU, Static)
- Network Interface
- Ubuntu Linux Virtual Machine
- NGINX installed via cloud-init (custom_data)

## Features

- Infrastructure as Code (Terraform)
- Variable-driven configuration
- External cloud-init script (nginx.sh)
- Tagged resources
- Output for public URL

## 🚀 Deployment Steps

### 1️⃣ Login to Azure CLI
```bash
az login
```

### 2️⃣ Initialize Terraform
```bash
terraform init
```

### 3️⃣ Review Plan
```bash
terraform plan
```

### 4️⃣ Apply Configuration
```bash
terraform apply
```

### 5️⃣ Access NGINX
Open the output URL in browser.

## 🧹 Clean Up
```bash
terraform destroy
```


This is a minor DevOps project demonstrating Terraform-based Azure infrastructure provisioning.
