resource "azurerm_resource_group" "example" {
  name     = "database-rg-session-backend"
  location = "West US"
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "mystorage27112020backend"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_server" "example" {
  name                         = "mssqlserver26112020backend"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
#  resource_group_name          = "database-rg"
#  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  tags = {
    environment = "production"
  }
}

resource "azurerm_sql_database" "example" {
  name                = "myexamplesqldatabasebackend"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  server_name         = azurerm_sql_server.example.name
  tags = {
    environment = "production"
  }
}

resource "null_resource" "policy"{
  provisioner "local-exec" {
    command = "az sql db threat-policy update -g database-rg-session  -s mssqlserver26112020 -n myexamplesqldatabase --state Enabled --storage-account mystorage27112020"
  }
  depends_on = [azurerm_sql_database.example]
}