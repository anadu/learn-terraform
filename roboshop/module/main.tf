data "azurerm_resource_group" "example" {
  name = "terraform"
}

data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "terraformvnet"
  resource_group_name  =  data.azurerm_resource_group.example.name
}

resource "azurerm_network_interface" "example" {
  name                = "${var.component}-robo"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

resource "azurerm_public_ip" "example" {
  name                = var.component
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = var.component
  }
}
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = data.azurerm_network_interface.example.id
  network_security_group_id = data.azurerm_network_security_group.example.id
}
resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.component
  }
}
resource "azurerm_virtual_machine" "main" {
  name                  = var.component
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
   delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/7b6c642c-6e46-418f-b715-e01b2f871413/resourceGroups/trail1/providers/Microsoft.Compute/galleries/LDOTrail/images/rhel9-devops-practice/versions/04.12.2024"
  } 
  storage_os_disk {
    name              = var.component
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile { 
    computer_name  = var.component
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    component= var.component
  }
} 