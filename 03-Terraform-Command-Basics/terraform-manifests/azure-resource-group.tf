# Terraform Settings Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.21.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create Resource Group 
resource "azurerm_resource_group" "ags" {
  location = "eastus"
  name = "ags-rg1"  
}
