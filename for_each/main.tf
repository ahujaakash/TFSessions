variable "locationvar" {
default = {
    "rg1" = "eastus",
    "rg2" =  "eastus2",
    "rg3" = "westus"
  }
}

resource "azurerm_resource_group" "rg"{
for_each =  var.locationvar

name = each.key
location = each.value


}