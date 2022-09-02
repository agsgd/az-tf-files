# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "ags-myrg1" {
  name = "ags-myrg-1"
  location = "East US"
}

# Resource-2: Random String 
resource "random_string" "ags-myrandom" {
  length = 16
  upper = false 
  special = false
}

# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.ags-myrandom.id}"
  resource_group_name      = azurerm_resource_group.ags-myrg1.name
  location                 = azurerm_resource_group.ags-myrg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"


  tags = {
    environment = "staging"
  }
}