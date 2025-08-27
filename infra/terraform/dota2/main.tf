resource "azurerm_resource_group" "main_rg" {
  name     = var.main_resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "dota" {
  name                     = var.dota_storage_account_name
  resource_group_name      = azurerm_resource_group.main_rg.name
  location                 = azurerm_resource_group.main_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true
}

resource "azurerm_storage_container" "raw" {
  name                  = var.raw_container_name
  storage_account_name  = azurerm_storage_account.dota.name
  container_access_type = "private"
}

# We need a storage account for storing the function app logs and metadata
resource "azurerm_storage_account" "functionappst" {
  name                      = var.function_app_storage_account_name
  resource_group_name       = azurerm_resource_group.main_rg.name
  location                  = azurerm_resource_group.main_rg.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_storage_container" "functionappcontainer" {
  name                  = var.function_app_container_name
  storage_account_name  = azurerm_storage_account.functionappst.name
  container_access_type = "private"
}

resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.function_app_workspace_name
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "app_insights" {
  name                = var.function_app_insights_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.log_workspace.id
}

resource "azurerm_service_plan" "dota_plan" {
  name                = var.function_service_plan_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  os_type             = "Linux"
  sku_name            = "FC1"
}

resource "azurerm_function_app_flex_consumption" "ingestion_fun" {
  name = var.function_app_function_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location = azurerm_resource_group.main_rg.location
  service_plan_id = azurerm_service_plan.dota_plan.id

  storage_container_type = "blobContainer"
  storage_container_endpoint = "${azurerm_storage_account.functionappst.primary_blob_endpoint}${azurerm_storage_container.functionappcontainer.name}"
  storage_authentication_type = "StorageAccountConnectionString"
  storage_access_key = azurerm_storage_account.functionappst.primary_access_key
  runtime_name = var.function_app_runtime_name
  runtime_version = var.funciton_app_runtime_version
  maximum_instance_count = 50
  instance_memory_in_mb = 2048

  site_config {
  }
}

terraform {
  backend "azurerm" {}
}