# Dota2 Analytics E2E Pipeline (Azure Functions + Terraform) 

## Overview

This project sets up the analytics platform for Dota2 Analytics using **Azure Function App** to ingest the data from multiple API endpoints and storing the raw JSON file in **Blob**. The infrastructure is provisioned using **Terraform** with **GitHub Actions** as CI/CD.


## Architecture
1. **Azure Function App** (Python-based)
   - Handles multiple APIs and ingest data
   - Uses a flexible consumption plan for cost optimisation
2. **Azure Blob Storage**
   - Stores the raw JSON data fetched from APIs
3. **Terraform**
   - Automates the deployment and configuration of Azure resources