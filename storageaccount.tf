resource "azurerm_storage_account" "ghost_storage" {
  name                     = "ghostblogstorageaccount"
  resource_group_name      = "${azurerm_resource_group.ghost_rg.name}"
  location                 = "${azurerm_resource_group.ghost_rg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "ghost_storage_container" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.ghost_rg.name}"
  storage_account_name  = "${azurerm_storage_account.ghost_storage.name}"
  container_access_type = "private"
}

resource "azurerm_storage_share" "ghost_storage_fileshare" {
  name                 = "ghostfileshare"
  storage_account_name = "${azurerm_storage_account.ghost_storage.name}"
  quota                = 50
}