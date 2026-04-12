terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>4.8.0"
    }
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
    features {

    }
  subscription_id = "<set the subscription id here>" //use the service principal  instead of your root id
   resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "example" {
  name     = "dipendra-resource-group"
  location = "centralindia"
}

resource "azurerm_storage_account" "example" {
  name                     = "dipendra321"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}