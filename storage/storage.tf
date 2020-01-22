  
 # Configure the Microsoft Azure Provider
provider "azurerm" {
 # We recommend pinning to the specific version of the Azure Provider you're using
 # since new versions are released frequently
 version = "=1.38.0"
 # More information on the authentication methods supported by
# the AzureRM Provider can be found here:
# http://terraform.io/docs/providers/azurerm/index.html
   
   subscription_id = var.subscription_id
   client_id       = var.client_id
   client_secret   = var.client_secret
   tenant_id       = var.tenant_id
 }

 # Create a resource group for common resources
 resource "azurerm_resource_group" "democommonrg" {
   name     = var.resource_group_name_common
   location = var.resource_group_location
 }

## Manages an Azure Storage Account.
## https://www.terraform.io/docs/providers/azurerm/r/storage_account.html 

resource "azurerm_storage_account" "demosa" {
  name                     = var.storageName
  resource_group_name      = "${azurerm_resource_group.democommonrg.name}"
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "demo"
  }
}