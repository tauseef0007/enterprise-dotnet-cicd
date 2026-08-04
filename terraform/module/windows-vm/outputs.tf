output "vm_id" {
  value = azurerm_windows_virtual_machine.this.id
}

output "nic_id" {
  value = azurerm_network_interface.this.id
}