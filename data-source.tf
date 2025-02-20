provider "azurerm" {
  features {}
  subscription_id = "68822ef6-c7c9-4c26-8330-5662dc85921f"
}

data "azurerm_resource_group" "example" {
  name = "terraform"
}

output "resource_group" {
   value = data.azurerm_resource_group.example
}
