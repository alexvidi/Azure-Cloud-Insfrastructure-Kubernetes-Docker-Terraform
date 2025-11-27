# -----------------------------------------------------------------------------
# Terraform provider configuration for Azure
# -----------------------------------------------------------------------------
# This block tells Terraform which external providers we need.
# In this project we use the official Azure provider: "azurerm".
terraform {
  required_providers {
    azurerm = {
      # Source location of the Azure provider in the Terraform registry.
      source  = "hashicorp/azurerm"
      # Use any 3.x version. This keeps it stable.
      version = "~> 3.0"
    }
  }
}

# -----------------------------------------------------------------------------
# Azure Resource Manager (azurerm) provider
# -----------------------------------------------------------------------------
# This provider allows Terraform to create and manage resources in Azure.
provider "azurerm" {
  features {}
}

