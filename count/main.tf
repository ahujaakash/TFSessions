resource "azurerm_resource_group" "rg" {
name = "var.name-${format("%02d", count.index+1)}"
location = "eastus2"
count = var.instance_count
}
