resource "azurerm_sql_server" "sqlserver" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version
  administrator_login          = var.admin
  administrator_login_password = var.password

  tags                         = var.tags
  
}