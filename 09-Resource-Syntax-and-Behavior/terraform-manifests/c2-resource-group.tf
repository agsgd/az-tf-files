# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "ags-myrg" {
  name = "myrg-1"
  location = "East US"
}