# Specify required providers and their versions
terraform {
  required_providers {
    # Azure resource manager provider
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
    }
  }
}

# Configure the Azure provider
provider "azurerm" {
  features {}
}