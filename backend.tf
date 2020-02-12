terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-storage"
    storage_account_name = "terraformst"
    container_name       = "ghost-blog-staging"
    key                  = "staging.terraform.tfstate"
  }
}