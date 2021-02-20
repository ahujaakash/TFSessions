module "rg" {
    source   = "E:/Terraform/Codes/codes/Class_Assignments/modules/resource_group"
    name     = var.name
    location = var.location
}