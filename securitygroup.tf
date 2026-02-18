resource "azurerm_network_security_group" "mynsg" {
  name                = "my-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  tags = {
  environment = "dev"
  project     = "nginx-terraform"
}

}

resource "azurerm_network_security_rule" "myrule" {
  name                        = "my-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.mynsg.name
}
resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "allow-ssh"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.mynsg.name
}

resource "azurerm_subnet_network_security_group_association" "myassociation" {
  subnet_id                 = azurerm_subnet.mysubnet.id
  network_security_group_id = azurerm_network_security_group.mynsg.id
}

resource "azurerm_public_ip" "mypublicip" {
  name                = "my-public-ip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  sku = "Standard"
  tags = {
  environment = "dev"
  project     = "nginx-terraform"
}

}

resource "azurerm_network_interface" "myinterface" {
  name                = "my-network-interface"
  location            = var.location
  resource_group_name = var.resource_group
  tags = {
  environment = "dev"
  project     = "nginx-terraform"
}


  ip_configuration {
    name                          = "my-ip-config"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip.id
    
  }
}