variable "main_resource_group_name" {
    type = string
    description = "Name of the Azure Resource Group"
}

variable "location" {
    description = "Azure region where resources will be deployed"
    type = string
    default = "swedencentral"
}

variable "dota_storage_account_name" {
    description = "Name of the Azure Storage Account"
    type    = string
}

variable "raw_container_name" {
    description = "Name of the blob container"
    type    = string
}