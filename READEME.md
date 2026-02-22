# Azure NGINX Deployment using Terraform

This project demonstrates Infrastructure as Code on Azure using Terraform.

---

## 📌 Project Evolution

This project is built progressively in phases:

- Phase 1 – Basic Infrastructure Deployment
- Phase 2 – Remote Backend & State Locking
- Phase 3 – Security Hardening (Coming Next)
- Phase 4 – High Availability & Scaling (Planned)

---

# 🟢 Phase 1 – Basic Infrastructure

## What Was Built

- Resource Group
- Virtual Network
- Subnet
- Network Security Group (Ports 22 & 80)
- Public IP (Standard SKU)
- Linux VM
- NGINX auto-installed via cloud-init

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

---

# 🟡 Phase 2 – Remote Backend Configuration

## What Was Added

- Separate Resource Group (`tfstate-rg`)
- Azure Storage Account
- Blob Container
- Remote Terraform state
- State locking via Azure Blob Lease

## Backend Configuration

```hcl
backend "azurerm" {
  resource_group_name  = "tfstate-rg"
  storage_account_name = "yourstorageaccount"
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
}
```

### Architecture Overview

Azure Subscription
│
├── tfstate-rg
│     └── Storage Account (Remote Terraform State)
│
└── my-rg
      ├── Virtual Network
      ├── Subnet
      ├── Network Security Group
      ├── Public IP
      └── Linux VM (NGINX)

## Why This Matters

- Enables team collaboration
- Prevents local state corruption
- Provides automatic state locking
- Production-style setup

---

# 🔐 Phase 3 – Security Hardening

### 📌 Current Version
**Phase 3 – Secure SSH Access Enabled**

This phase focuses on improving VM-level and infrastructure-level security.

### 🔐 Security Improvements Implemented

- Disabled password-based SSH authentication
- Implemented SSH key-based authentication
- Restricted SSH (Port 22) access to personal public IP only
- Enforced secure SSH configuration
- Removed global SSH exposure

### 🔄 What Changed in Infrastructure

#### 🔴 Before Phase 3
- Password authentication enabled
- Port 22 open to `0.0.0.0/0`

#### 🟢 After Phase 3
- `disable_password_authentication = true`
- SSH key configured via `admin_ssh_key`
- NSG rule restricted to `YOUR_PUBLIC_IP/32`

### 🔑 SSH Connection

```bash
ssh -i <private_key_file> <admin_username>@<public_ip>

Why This Matters

Reduces brute-force attack risk

Follows cloud security best practices

Implements least privilege access

Aligns with production-grade infrastructure standards

---

# 🧹 Cleanup

```bash
terraform destroy
```






```




This is a minor DevOps project demonstrating Terraform-based Azure infrastructure provisioning.
