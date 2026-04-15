locals {
  formatted_name = lower(replace(var.project_name, " ", "-"))
  merge_tags = merge(var.default_tags, var.environment_tags)
  constraint_name = length(var.storage_account_name) <= 24 && can(regex("^[a-z0-9]+$", var.storage_account_name))
}


resource "azurerm_resource_group" "rg" {
    name = "${local.formatted_name}-rg"
    location = "centralindia"

    tags = local.merge_tags
  
}

resource "azurerm_storage_account" "example" {
  name                     = local.constraint_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

output "rgname" {
    value = azurerm_resource_group.rg.name
}

output "storage_name" {
    value = azurerm_storage_account.example.name
}