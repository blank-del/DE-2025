variable "tf_resource_group_name" {
    type = string
    description = "Name of the Azure Resource Group for Terraform"
}

variable "location" {
    description = "Azure region where resources will be deployed"
    type = string
    default = "swedencentral"
}

variable "tf_storage_account_name" {
    type = string
    description = "Name of the Storage Account for Terraform"
}

variable "tf_container_name" {
    type = string
    description = "Name of the containter for Terraform"
}