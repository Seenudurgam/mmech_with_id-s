  
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

#Manages a Key Vault.
resource "azurerm_key_vault" "demokv" {
  name                        = var.kv
  location                    = "${azurerm_resource_group.democommonrg.location}"
  resource_group_name         = "${azurerm_resource_group.democommonrg.name}"
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id

  sku_name = "standard"

  access_policy { 
    tenant_id = var.tenant_id
    object_id = var.object_id
    
    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = {
    environment = "demo"
  }
}