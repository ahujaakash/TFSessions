resource "azurerm_resource_group" "example" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "mystorage" {
  name                     = var.storagename
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  depends_on = [azurerm_resource_group.example]
}


resource "azurerm_sql_server" "example" {
  name                         = var.sqlservername
  resource_group_name          = var.rgname
  location                     = var.location
#  resource_group_name          = "database-rg"
#  location                     = "West US"
  version                      = var.sqlversion
  administrator_login          = var.username
  administrator_login_password = var.password

  tags = {
    environment = "production"
  }
  depends_on = [azurerm_storage_account.mystorage]
}

resource "azurerm_sql_database" "example" {
  name                = var.dbname
  resource_group_name = var.rgname
  location            = var.location
  server_name         = var.sqlservername
  tags = {
    environment = "production"
  }
  depends_on = [azurerm_sql_server.example]
}

/*
resource "null_resource" "policy"{
  provisioner "local-exec" {
    command = "az sql db threat-policy update -g database-rg-session-explicit  -s mssqlserver26112020explicit -n myexamplesqldatabaseexplicit --state Enabled --storage-account mystorageexplicit"
  }
  depends_on = [azurerm_sql_database.example]
}
*/