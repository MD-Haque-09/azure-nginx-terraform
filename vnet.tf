resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group
  location = var.location
  tags = {
  environment = "dev"
  project     = "nginx-terraform"
}

}

resource "azurerm_virtual_network" "myvnet" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags = {
  environment = "dev"
  project     = "nginx-terraform"
}

}

resource "azurerm_subnet" "mysubnet" {
  name                 = "my-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.1.0/24"]
  

}
