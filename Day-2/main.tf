terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>4.8.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "tfstate-day04"
      storage_account_name = "day0421265"
      container_name       = "tfstate"
      key                  = "dev.terraform.tfstate"                 # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
  required_version = ">=1.9.0"
}
provider "azurerm" {
    features {

    }
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