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
}

resource "azurerm_storage_container" "raw" {
  name                  = var.raw_container_name
  container_access_type = "private"
}