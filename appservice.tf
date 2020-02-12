resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "${azurerm_resource_group.ghost_rg.name}-plan"
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
resource "azurerm_app_service" "dockerapp" {
  name                = "${azurerm_resource_group.ghost_rg.name}-dockerapp"
  location            = "${azurerm_resource_group.ghost_rg.location}"
  resource_group_name = "${azurerm_resource_group.ghost_rg.name}"
  app_service_plan_id = "${azurerm_app_service_plan.appserviceplan.id}"

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false

    /*
    # Settings for private Container Registires  
    DOCKER_REGISTRY_SERVER_URL      = ""
    DOCKER_REGISTRY_SERVER_USERNAME = ""
    DOCKER_REGISTRY_SERVER_PASSWORD = ""
    */
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