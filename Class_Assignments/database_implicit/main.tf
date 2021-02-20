resource "azurerm_resource_group" "example" {
  name     = "database-rg-session"
  location = "West US"
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "mystorage27112020"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
#  resource_group_name          = "database-rg"
#  location                     = "West US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_server" "example" {
  name                         = "mssqlserver26112020"
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
  name                = "myexamplesqldatabase"
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

/*
az sql db audit-policy update -g mygroup -s myserver -n mydb --state Enabled \
    --bsts Enabled --storage-account mystorage
    */