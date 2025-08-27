variable "main_resource_group_name" {
    type        = string
    description = "Name of the Azure Resource Group"
}

variable "location" {
    description = "Azure region where resources will be deployed"
    type        = string
    default     = "swedencentral"
}

variable "dota_storage_account_name" {
    description = "Name of the Azure Storage Account"
    type        = string
}

variable "raw_container_name" {
    description = "Name of the blob container"
    type        = string
}

variable "function_app_storage_account_name" {
    description = "Name of the Function App Storage Account"
}

variable "function_app_container_name" {
    description = "Name of the Function App Container"
    type        = string
}

variable "function_app_workspace_name" {
    description = "Name of the Function App Log Analytics Workspace"
    type        = string
}

variable "function_app_insights_name" {
    description = "Name of the Function App Insights"
    type        = string
}

variable "function_service_plan_name" {
    description = "Name of the Function App Service Plan"
    type        = string
}

variable "function_app_function_name" {
    description = "Name of the Function App Function Name"
    type        = string
}

variable "function_app_runtime_name" {
    description = "Name of the Function App Runtime"
    type        = string
    default     = "python"
}

variable "funciton_app_runtime_version" {
    description = "Version of the Function App Runtime"
    type        = string
    default     = "3.11"
}