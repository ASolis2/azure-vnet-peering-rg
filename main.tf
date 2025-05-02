provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = "rg-vnet1"
  location = "East US"
}

resource "azurerm_resource_group" "rg2" {
  name     = "rg-vnet2"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet-app"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet-db"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name
}

resource "azurerm_virtual_network_peering" "peer1to2" {
  name                         = "peer-vnet1-to-vnet2"
  resource_group_name          = azurerm_resource_group.rg1.name
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "peer2to1" {
  name                         = "peer-vnet2-to-vnet1"
  resource_group_name          = azurerm_resource_group.rg2.name
  virtual_network_name         = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet1.id
  allow_virtual_network_access = true
}

