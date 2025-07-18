# Specify required providers and their versions
terraform {
  required_providers {
    # Azure resource manager provider
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
    }

    # Random provider for generating random values to create uniqueness
    random = {
        source = "hashicorp/random"
        version = "~> 3.0"
    }
  }
}

# Configure the Azure provider
provider "azurerm" {
  features {}
}