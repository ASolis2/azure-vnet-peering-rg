# Project 16 - Azure VNet Peering Across Resource Groups

## 📘 Overview

This project demonstrates how to provision two virtual networks in separate resource groups and configure VNet peering between them using Terraform and the AzureRM provider.

## 🎯 Objectives

- Create two separate Azure Resource Groups
- Deploy one Virtual Network (VNet) into each
- Establish bidirectional peering between them
- Authenticate via Azure CLI or environment variables
- Push fully working project with README and screenshot to GitHub

## 🛠️ Technologies Used

- Azure
- Terraform
- Azure CLI
- Git + GitHub

## 🧱 Terraform Files

- `main.tf`: Infrastructure as Code for resource groups, VNets, and peerings
- `outputs.tf`: Outputs for both VNets
- `.gitignore`: Ignores .terraform and state files

## 🚀 Deployment Instructions

1. Authenticate:
   ```bash
   az login --use-device-code
   ```

2. (If needed) Set environment variables:
   ```bash
   export ARM_SUBSCRIPTION_ID="your-sub-id"
   export ARM_TENANT_ID="your-tenant-id"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Apply:
   ```bash
   terraform apply -auto-approve
   ```

## 📸 Screenshot

Be sure to include a screenshot of the terminal output after apply:

- `terraform-vnet-peering-success.png`

## 🔁 GitHub Steps

```bash
git init
git branch -M main
git remote add origin https://github.com/ASolis2/azure-vnet-peering-rg.git
git add .
git commit -m "Project 16 - VNet Peering with screenshot"
git push -u origin main
```

## ✅ Output

```bash
Apply complete! Resources: X added, 0 changed, 0 destroyed.
Outputs:
vnet1_id = "/subscriptions/.../vnet-app"
vnet2_id = "/subscriptions/.../vnet-db"
```

## 🧠 Knowledge Check

1. Why are two separate peering blocks required?
2. What happens if address spaces overlap between VNets?
3. Can VNets in different regions be peered?

---
