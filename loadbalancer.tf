

resource "azurerm_public_ip" "lbip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = azurerm_resource_group.myrg.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "mylb" {
  name                = "my-loadbalancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.myrg.name
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lbip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend" {
    name = "backend-pool"
    loadbalancer_id = azurerm_lb.mylb.id
  
}

resource "azurerm_network_interface_backend_address_pool_association" "backend_assoc" {
    for_each = var.vm_config
    network_interface_id = azurerm_network_interface.myinterface[each.key].id
    ip_configuration_name = "my-ip-config"
    backend_address_pool_id = azurerm_lb_backend_address_pool.backend.id
}


resource "azurerm_lb_probe" "http_probe" {
  name = "http-probe"
  loadbalancer_id = azurerm_lb.mylb.id
  protocol = "Tcp"
  port = 80
  
  
}

resource "azurerm_lb_rule" "http_rule" {
    name = "http-rule"
    loadbalancer_id = azurerm_lb.mylb.id
    frontend_ip_configuration_name = "PublicIPAddress"
    backend_address_pool_ids = [
        azurerm_lb_backend_address_pool.backend.id
    ]
    probe_id = azurerm_lb_probe.http_probe.id
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
  
}