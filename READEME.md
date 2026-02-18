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

```bash
az login
terraform init
terraform plan
terraform apply
```

After successful deployment, Terraform will output something like:

```bash
vm_public_url = "http://20.115.35.158"
```

Open the output URL in your browser.

---

## 🧹 Clean Up

```bash
terraform destroy
```



This is a minor DevOps project demonstrating Terraform-based Azure infrastructure provisioning.
