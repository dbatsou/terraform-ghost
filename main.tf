resource "azurerm_resource_group" "ghost_rg" {
  name     = "ghostblog-azure"
  location = "northeurope"

  tags = {
    environment = "Staging"
  }
}