variable "resource_group" {
    description = "The name of the resource group in which to create the resources."
    type        = string
    default     = "my-resource-group"
  
}

variable "location" {

    description = "The Azure region in which to create the resources."
    type        = string
    default     = "Central India"
  
}



variable "admin_username" {
    description = "The admin username for the virtual machine."
    type        = string
    default     = "adminuser"
  
}

variable "vm_size" {
    description = "The size of the virtual machine."
    type        = string
    default     = "Standard_B1s"
  
}

variable "vm_config" {

    type = map(any)

    default = {
      
      vm1 = {
        size = "Standard_B1s"
      }

      vm2 = {

        size = "Standard_B1s"
      }
    }

 
  
}