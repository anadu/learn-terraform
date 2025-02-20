provider "azurerm" {
  features {}
  subscription_id = "68822ef6-c7c9-4c26-8330-5662dc85921f"
}
// to retriew the data from azure console
data "azurerm_resource_group" "example" {
  name = "terraform"
}

output "resource_group" {
   value = data.azurerm_resource_group.example
}
