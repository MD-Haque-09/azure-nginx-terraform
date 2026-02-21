terraform {

  backend "azurerm" {
    resource_group_name = "backend-rg"

    storage_account_name = "backendterraformstorage"
    container_name = "terraformstate"
    key = "terraform.tfstate"
    
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.60.0"
    }
  }
}



provider "azurerm" {
  features {
    
  }
}