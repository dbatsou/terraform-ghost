resource "azurerm_storage_account" "ghostblog" {
  name                     = "${azurerm_resource_group.ghost_rg.name}"
  resource_group_name      = "${azurerm_resource_group.ghost_rg.name}"
  location                 = "${azurerm_resource_group.ghost_rg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "ghostblog" {
  name                  = "${azurerm_resource_group.ghost_rg.name}"
  resource_group_name   = "${azurerm_resource_group.ghost_rg.name}"
  storage_account_name  = "${azurerm_storage_account.ghostblog.name}"
  container_access_type = "private"
}

resource "azurerm_storage_share" "ghostblog" {
  name                 = "${azurerm_resource_group.ghost_rg.name}"
  storage_account_name = "${azurerm_storage_account.ghostblog.name}"
  quota                = 50
}