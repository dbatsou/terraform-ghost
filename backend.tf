terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-storage"
    storage_account_name = "terraformdno"
    container_name       = "ghost-blog"
    key                  = "staging.terraform.tfstate"
  }



}
provider "azurerm" {
  version = "=2.0.0"
  features {}
}

