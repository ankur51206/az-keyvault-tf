terraform {
  backend "azurerm" {
    resource_group_name  = "realimmerse_group"
    storage_account_name = "realimmersegroupdiag"
    container_name       = "tfstate"
    key                  = "${env.STATE_FOLDER}/terraform.tfstate"
  }
}