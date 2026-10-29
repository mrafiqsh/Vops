Azure Storage Account Deployment using GitHub Actions
Overview
This repository automates the deployment of an Azure Storage Account using:

GitHub Actions
Azure Service Principal Authentication
Bicep Infrastructure as Code
Azure Resource Manager (ARM)
The workflow deploys resources to Azure whenever changes are pushed to the main branch or when manually triggered.

Architecture
GitHub Repository | v GitHub Actions | v Azure Login (Service Principal) | v Azure Resource Group | v Azure Storage Account

Repository Structure
.
├── .github
│   └── workflows
│       └── deploy-storage.yml
│
├── infra
│   ├── main.bicep
│   └── parameters.json
│
└── README.md
Prerequisites
Before using this repository, ensure the following:

Azure Subscription
Contributor role assigned to Service Principal
GitHub Repository
GitHub Actions enabled
Azure CLI installed (optional for local testing)
Required GitHub Secrets
Create the following repository secret:

Secret Name
AZURE_CREDENTIALS
Secret Value
{
  "clientId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "clientSecret":"xxxxxxxxxxxxxxxxxxxxxxxx",
  "subscriptionId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "tenantId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
Navigate to:

Repository
→ Settings
→ Secrets and Variables
→ Actions
→ New Repository Secret
Storage Account Configuration
Update the parameter file:

infra/parameters.json
{
  "parameters": {
    "storageAccountName": {
      "value": "stgdev001abc"
    }
  }
}
Requirements:

Lowercase letters and numbers only
Globally unique
Length between 3 and 24 characters
Deployment Workflow
The workflow executes the following actions:

Checkout source code
Authenticate to Azure
Create Resource Group
Deploy Bicep template
Verify deployment
Workflow file:

.github/workflows/deploy-storage.yml
Manual Deployment
Navigate to:

GitHub Repository
→ Actions
→ Deploy Azure Storage Account
→ Run Workflow
Automatic Deployment
Deployment automatically starts when code is pushed to:

main
Example:

git add .
git commit -m "Deploy storage account"
git push origin main
Verify Deployment
Verify from Azure Portal:

Storage Accounts
Or Azure CLI:

az storage account list \
  --resource-group rg-storage-dev \
  --output table
Common Troubleshooting
Authentication Failure
Verify:

Service Principal credentials are correct
Secret name is AZURE_CREDENTIALS
Contributor role is assigned
Storage Account Name Already Exists
Change:

"storageAccountName": {
    "value": "vopsgithubstore"
}
to a globally unique name.

Deployment Failure
Review workflow logs:

GitHub Actions
→ Workflow Run
→ Failed Job
→ Logs
Security Recommendations
Current
Service Principal Secret stored in GitHub Secrets
Recommended
Use GitHub OIDC Federation instead of Client Secrets:

No password management
No secret expiration
Microsoft recommended approach
Deployment Outcome
After successful execution, the following Azure resources will be created:

Resource Group
Storage Account
StorageV2 Configuration
TLS 1.2 Enforcement
HTTPS Only Access
