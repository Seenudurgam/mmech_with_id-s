  
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
  
 # Create a resource group
resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
   location  = var.resource_group_location
}
  #Allows you to manage an Azure SQL Server
resource "azurerm_sql_server" "demosqlserver" {
  name                         = var.sqlserver
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  location                     = "${azurerm_resource_group.rg.location}"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

#Allows you to manage an Azure SQL Server
# azurerm_sql_database 

resource "azurerm_sql_database" "demosqlserverdb" {
  name                             =  var.db
  resource_group_name              =  "${azurerm_resource_group.rg.name}"
  location                         =  "${azurerm_resource_group.rg.location}"
  server_name                      = "${azurerm_sql_server.demosqlserver.name}"
  edition                          = "Basic"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"
}

# Enables the "Allow Access to Azure services" box as described in the API docs
# https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate

resource "azurerm_sql_firewall_rule" "demosqlfirewell" {
  name                = "allow-azure-services"
  resource_group_name =  "${azurerm_resource_group.rg.name}" 
  server_name         = "${azurerm_sql_server.demosqlserver.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}