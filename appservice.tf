resource "azurerm_app_service_plan" "ghostblog" {
  name                = "${azurerm_resource_group.ghost_rg.name}"
  location            = "${azurerm_resource_group.ghost_rg.location}"
  resource_group_name = "${azurerm_resource_group.ghost_rg.name}"

  # Define Linux as Host OS
  kind = "Linux"
reserved = true # Mandatory for Linux plans

  # Choose size
  sku {
    tier = "Basic"
    size = "B1"
  }
}

# Create an Azure Web App for Containers in that App Service Plan
resource "azurerm_app_service" "ghostblog" {
  name                = "${azurerm_resource_group.ghost_rg.name}"
  location            = "${azurerm_resource_group.ghost_rg.location}"
  resource_group_name = "${azurerm_resource_group.ghost_rg.name}"
  app_service_plan_id = "${azurerm_app_service_plan.ghostblog.id}"

  app_settings = {
    NODE_ENV =	"production"
    url = "${var.resource_group_prefix}${var.environments[terraform.workspace]}.azurewebsites.net"
  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|ghost:3-alpine"
    always_on        = "true"
  }

  identity {
    type = "SystemAssigned"
  }
}