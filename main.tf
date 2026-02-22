resource "azurerm_linux_virtual_machine" "myvm" {
  name                = "my-vm"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  disable_password_authentication = true
  admin_ssh_key {
    username = var.admin_username
    public_key = file("azurevmkey.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.myinterface.id
  ]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  

custom_data = base64encode(file("nginx.sh"))


}



