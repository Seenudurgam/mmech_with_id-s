variable "resource_group_name" {
  type        = string
  #description = "The default Azure region for the resource provisioning"
  #default = "mmech-ugm-dev"
}

variable "resource_group_location" {
  type        = string
  #description = "The default Azure region for the resource provisioning"
  #default = "West Europe"
}

variable "tenant_id" {
  type        = string
 # description = "tenant id"
  #default = "ac67e308-1f19-4011-9baa-c4df0351e262"
}

variable "object_id" {
  type        = string
  #description = "object id"
  #default = "1c584611-915e-4307-a62a-36f4ff1828fd"
}

variable "sqlserver" {
  type        = string
  #description = "Enter the Sql Server name"
  #default = "mmech-ugmsqlsrv"
}

variable "db" {
  type        = string
  #description = "Enter the Data base name"
  #default = "mmech-ugmdb"
}
