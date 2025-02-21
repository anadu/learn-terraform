data "azurerm_resource_group" "example" {
  name = "terraform"
}

data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "terraformvnet"
  resource_group_name  =  data.azurerm_resource_group.example.name
}