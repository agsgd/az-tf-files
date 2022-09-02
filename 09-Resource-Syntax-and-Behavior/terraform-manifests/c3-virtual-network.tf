# Resource-2: Create Virtual Network
resource "azurerm_virtual_network" "ags-myvnet" {
  name                = "ags-myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.ags-myrg.location
  resource_group_name = azurerm_resource_group.ags-myrg.name
  tags = {
    "Name" = "ags-myvnet-1"
    #"Environment" = "Dev"  # Uncomment during Step-10
  }
}

# Resource-3: Create Subnet
resource "azurerm_subnet" "ags-mysubnet" {
  name                 = "ags-mysubnet-1"
  resource_group_name  = azurerm_resource_group.ags-myrg.name
  virtual_network_name = azurerm_virtual_network.ags-myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Resource-4: Create Public IP Address
resource "azurerm_public_ip" "ags-mypublicip" {
  name                = "mypublicip-1"
  resource_group_name = azurerm_resource_group.ags-myrg.name
  location            = azurerm_resource_group.ags-myrg.location
  allocation_method   = "Static"
  tags = {
    environment = "Dev"
  }
}

# Resource-5: Create Network Interface
resource "azurerm_network_interface" "ags-myvmnic" {
  name                = "ags-vmnic"
  location            = azurerm_resource_group.ags-myrg.location
  resource_group_name = azurerm_resource_group.ags-myrg.name

  ip_configuration {
    name                          = "ags-internal"
    subnet_id                     = azurerm_subnet.ags-mysubnet.id
    private_ip_address_allocation = "Dynamic" 
    public_ip_address_id = azurerm_public_ip.ags-mypublicip.id 
  }
}

