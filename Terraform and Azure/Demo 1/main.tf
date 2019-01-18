# Define the provider type
provider "azurerm" {
# Define Provier version
  version = "=1.21.0"

# Store these outside Source Control or using Vault of sorts. 

  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

# Create a resource group with location and name
resource "azurerm_resource_group" "NICCON2019" {
  name     = "NICCONF"
  location = "West Europe"
}

# Create a virtual network within the resource group using a dynamic block
resource "azurerm_virtual_network" "test" {
  name                = "production-network"
  resource_group_name = "${azurerm_resource_group.NICCON2019.name}"
  location            = "${azurerm_resource_group.NICCON2019.location}"
  address_space       = ["10.0.0.0/16"]
}
