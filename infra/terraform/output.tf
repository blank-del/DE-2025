output "main_resource_group_name" {
    value = azurerm_resource_group.main_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.dota.name
}

output "storage_container_name" {
  value = azurerm_storage_container.raw.name
}