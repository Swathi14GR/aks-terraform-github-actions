Azure–GitHub OIDC Deployment Setup (Production) 
Overview 
This document provides complete setup instructions to deploy workloads to Azure using 
GitHub Actions with OpenID Connect (OIDC) authentication and a self‑hosted runner VM. 
The design avoids long‑lived secrets and follows enterprise security best practices. 
1. Prerequisites 
1. Azure subscription in required region 
2. Permission to create App Registrations and Federated Credentials 
3. Permission to create Virtual Machines 
4. GitHub repository admin access 
5. Create a storage account which is required to protect state files 
2. Azure ↔ GitHub OIDC Setup 
Why OIDC?
• No client secrets stored in GitHub 
• Short lived tokens generated per job 
• Scoped to repository and environment 
• Microsoft recommended authentication 
Step 1: Create Azure AD App Registration 
Run the following command: 
az ad app create --display-name github-oidc-prod 
Capture Client ID and Tenant ID from output. 
Step 2: Create Service Principal 
az ad sp create --id <CLIENT_ID> 
Step 3: Assign Role to Subscription 
az role assignment create \ --assignee <CLIENT_ID> \ --role Contributor \ --scope /subscriptions/<SUBSCRIPTION_ID> 
Step 4: Configure Federated Credential 
az ad app federated-credential create \ --id <CLIENT_ID> \ --parameters '{ 
"name": "github-prod", 
"issuer": "https://token.actions.githubusercontent.com", 
"subject": "repo:<ORG>/<REPO>:environment:production", 
"audiences": ["api://AzureADTokenExchange"] 
}' 
3. Self‑Hosted Runner VM Setup 
Purpose 
• Access to private Azure resources 
• Custom tooling support 
• Controlled execution environment 
• Enterprise performance 
Install Required Tools 
sudo apt update 
sudo apt install -y curl unzip git 
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash 
sudo apt install docker.io -y 
sudo usermod -aG docker azureuser 
az aks install-cli 
Install GitHub Runner 
mkdir actions-runner && cd actions-runner 
curl -o actions-runner-linux-x64.tar.gz \ -L 
https://github.com/actions/runner/releases/latest/download/actions
runner-linux-x64.tar.gz 
tar xzf actions-runner-linux-x64.tar.gz 
Configure Runner 
./config.sh --url https://github.com/<ORG>/<REPO> \ --token <RUNNER_TOKEN> \ --name azure-runner-prod \ --labels self-hosted,azure,prod 
Run as service: 
sudo ./svc.sh install 
sudo ./svc.sh start 
4. GitHub Environment Configuration 
6. Repository → Settings → Environments 
7. Create environment: production 
8. Add required reviewers 
9. Enable deployment protection 
5. Environment Secrets 
• AZURE_CLIENT_ID – App Registration Client ID 
• AZURE_TENANT_ID – Tenant ID 
• AZURE_SUBSCRIPTION_ID – Subscription ID 
Authentication uses only OIDC tokens – no client secrets stored. 
6. End‑to‑End Deployment Flow 
Developer Push → GitHub Actions → Approval in Production 
Environment → Self‑Hosted Runner VM → OIDC Token to Azure AD → 
Deployment to Azure Resources 
7. Security Highlights 
• Secret‑less authentication 
• Short lived tokens 
• Environment scoped access 
• Mandatory approvals 
