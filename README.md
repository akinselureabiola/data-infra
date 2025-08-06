# 🏗️ Data Infrastructure Provisioning with Terraform

Welcome to the **Data Infrastructure** repository! This project leverages **Terraform** to provision scalable, secure, and automated **AWS Cloud** resources for modern data engineering and analytics workloads.

---

## 📌 Project Overview

This repository contains Infrastructure as Code (IaC) written in **Terraform** to set up foundational cloud infrastructure components on **Amazon Web Services (AWS)**. These components are intended to support **data pipelines**, **ETL workflows**, **data lakes**, or **analytics platforms** by providing a modular, reproducible, and easily maintainable infrastructure stack.

---

## 🧱 Provisioned AWS Resources

Below is a high-level overview of the AWS resources provisioned:

- **VPC (Virtual Private Cloud)**  
  - Custom VPC with public and private subnets  
  - Internet Gateway and NAT Gateway for controlled internet access  
  - Route Tables and Subnet associations

- **S3 Buckets**  
  - Used for storing raw, processed, and curated data  
  - Versioning and encryption enabled  
  - Lifecycle policies for storage cost optimization

- **IAM (Identity and Access Management)**  
  - Roles and policies for secure access to resources  
  - IAM users/groups for data platform access

- **EC2 Instances** (optional)  
  - Configured for data processing or orchestration (e.g., Airflow)

- **RDS / PostgreSQL**  
  - Managed relational database for metadata or analytical storage  
  - Encrypted at rest, with automated backups

- **Glue / Athena / Redshift** (optional if included)  
  - Serverless ETL jobs or interactive querying

> ⚠️ _Note: Some of these services are conditional or module-based. Check the `main.tf` and `modules/` directory for included components._

---

## 📂 Repository Structure

data-infra/
├── modules/ # Reusable Terraform modules
│ ├── vpc/
│ ├── s3/
│ ├── iam/
│ ├── ec2/
│ └── rds/
├── environments/ # Separate configs per environment
│ ├── dev/
│ └── prod/
├── main.tf # Entry point to provision resources
├── variables.tf # Input variables
├── outputs.tf # Output values
├── provider.tf # AWS provider configuration
└── README.md # Project documentation

yaml
Copy
Edit

---

## 🚀 Getting Started

### 🔧 Prerequisites

- [Terraform v1.4+](https://www.terraform.io/downloads)
- AWS CLI configured with credentials (`aws configure`)
- An AWS account with appropriate IAM permissions

### 📦 Installation & Deployment

1. **Clone the repository**
   ```bash
   git clone https://github.com/akinselureabiola/data-infra.git
   cd data-infra
Initialize Terraform

bash
Copy
Edit
terraform init
Preview the infrastructure changes

bash
Copy
Edit
terraform plan
Apply the infrastructure

bash
Copy
Edit
terraform apply
Destroy the infrastructure

Use this to tear down all resources when no longer needed.

bash
Copy
Edit
terraform destroy
⚙️ Configuration
All configurable parameters (e.g., region, instance types, subnet CIDRs, S3 names) are managed via variables.tf and can be overridden using:

terraform.tfvars file

-var CLI flag

Environment variables

Example terraform.tfvars:

hcl
Copy
Edit
aws_region = "eu-central-1"
project_name = "data-platform"
environment = "dev"
enable_s3_versioning = true
🔐 Security & Best Practices
Follows least privilege principle via custom IAM roles and policies

All data-at-rest is encrypted using AWS-managed KMS keys

Modular structure encourages reuse and separation of environments (e.g., dev, staging, prod)

Supports tagging for cost allocation and resource identification

📈 Use Cases
Bootstrapping a data lake architecture

Provisioning data warehouse environments (Redshift, RDS)

Hosting data ingestion and transformation workflows (Airflow, Spark)

Building end-to-end cloud-based analytics platforms

🧪 Testing & Validation
terraform validate — Syntax validation

terraform plan — Infrastructure diff before apply

Modular testing supported via Terraform's built-in test framework or third-party tools like Terratest

📘 Documentation
Terraform Docs

AWS Docs

Internal module usage is documented in each module’s README.md (if available)

📝 License
This project is licensed under the MIT License. See LICENSE for details.

🤝 Contributions
Pull requests are welcome! For major changes, please open an issue first to discuss your proposed changes.

📬 Feedback & Support
If you encounter any issues or have feature requests, feel free to open an issue.
