# Project: AWS-Based Home Lab
## Goal
Built a cloud lab on AWS using my home PC to deploy a web server, practicing virtualization, Infrastructure-as-Code (IaC), and CI/CD.
## Tools
- AWS Free Tier (EC2, VPC)
- Terraform
- Docker
- GitHub Actions
## Steps
1. Created an IAM user with AdministratorAccess.
2. Set up billing alerts and cost monitoring.
3. Defined a VPC, subnet, security group, and EC2 instance using Terraform.
4. Connected to the EC2 instance and installed Docker.
5. Deployed an NGINX web server.
6. Attempted to set up a CI/CD pipeline with GitHub Actions.
## Results
Successfully created a VPC (HomeLabVPC) and subnet (PublicSubnet), launched an EC2 instance (WebServerLab), and deployed an NGINX web server. CI/CD pipeline setup is in progress, with a SignatureDoesNotMatch error encountered (see troubleshooting).
## Troubleshooting
- Encountered a "SignatureDoesNotMatch" error in GitHub Actions, indicating a potential issue with AWS credentials. Updated secrets and re-pushed changes to retry.
## Screenshots
