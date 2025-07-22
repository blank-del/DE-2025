resource "azurerm_resource_group" "tf_rg" {
    name = var.tf_resource_group_name
    location = var.location
}

resource "azurerm_storage_account" "tf_st" {
    name = var.tf_storage_account_name
    resource_group_name = azurerm_resource_group.tf_rg.name
    location = azurerm_resource_group.tf_rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tf_state" {
  name                  = var.tf_container_name
  storage_account_name  = azurerm_storage_account.tf_st.name
  container_access_type = "private"
}