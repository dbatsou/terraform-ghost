resource "azurerm_resource_group" "ghost_rg" {
  name     = "${var.resource_group_prefix}${var.environments[terraform.workspace]}"
  location = "northeurope"

  tags = {
    environment = "${terraform.workspace}"
  }
}