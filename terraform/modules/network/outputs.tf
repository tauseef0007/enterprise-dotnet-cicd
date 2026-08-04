output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "app_subnet_id" {
  value = azurerm_subnet.app.id
}

output "public_ip_id" {
  value = azurerm_public_ip.this.id
}