terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-storage"
    storage_account_name = "terraformst"
    container_name       = "ghost-blog-staging"
    key                  = "staging.terraform.tfstate"
    access_key = "eybrEYRPFO9gmbzyRbxWf5K5eavsMf8mB89rIeDwfaGlVgOB17fa506r2bWSTDwssLdUVaHcN9zME8Ijo+T65w=="
  }
}