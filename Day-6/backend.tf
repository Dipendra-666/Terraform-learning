 terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-day04"
      storage_account_name = "day0421265"
      container_name       = "tfstate"
      key                  = "dev.terraform.tfstate"                 # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
 }
