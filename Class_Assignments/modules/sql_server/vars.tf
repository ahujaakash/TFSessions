  variable "name" {
      description = "name of the sql server"      
 }
  variable "resource_group_name" {
      description = "Name of the resource Group"
  }

  variable "location" {
      description = "location of sql server"
  }                     

  variable "version" {
      description = "version of sql server"
  }                      
  variable "administrator_login" {
       description = "Username for Admin"
       default     = "azadmin"
  }

  variable "administrator_login_password" {
       description = "Password for Sql Server"
  } 

  variable "tags" {
      description = "Tags for Resource"
      type        = map
  }
  