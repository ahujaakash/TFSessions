terraform{
    backend "azurerm" {
        resource_group_name  = "database-rg-session"
        storage_account_name = "mystorage27112020"
        container_name       = "tfstate"
        key                  = "firsttfstate/terraform.tfstate"
        access_key           = "330ULfi+GLp6rgF1lishnM1JeEZYeTOPWa3dnr/KS8PsHSyYAuMDDEXCud1XnAyT30vxkb8uvy4XhvWapaNYyA=="
    }
}