terraform {
   backend "local" {
         path = "E://Terraform//backend//terraform.tfstate"
   }
}

/*
terraform{
    backend "azurerm" {
        resource_group_name  = "sqlpoc_rg2"
        storage_account_name = "mybackup11102020"
        container_name       = "tfstate"
        key                  = "firsttfstate/terraform.tfstate"
        access_key           = "T/Ehrj/OWA69ThFdPl38j30HXWVhZITDoHsKAT+tmGkpk71Ywy5oAW6kIMtj6v7qZZWGkQjr77JfyNsG+nTzVw=="
    }
}
*/