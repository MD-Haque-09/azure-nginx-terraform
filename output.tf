output "vm_public_url" {
    value = "http://${azurerm_public_ip.mypublicip.ip_address}"
  
}