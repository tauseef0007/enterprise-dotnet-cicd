resource "azurerm_resource_group" "backend" {

  name     = var.resource_group_name
  location = var.location

}

resource "azurerm_storage_account" "backend" {

  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location

  account_tier             = "Standard"

  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "backend" {

  name                  = var.container_name

  storage_account_id    = azurerm_storage_account.backend.id

  container_access_type = "private"

}

resource "azurerm_virtual_machine_extension" "iis" {

  name                 = "install-iis"

  virtual_machine_id   = azurerm_windows_virtual_machine.this.id

  publisher            = "Microsoft.Compute"

  type                 = "CustomScriptExtension"

  type_handler_version = "1.10"

  settings = <<SETTINGS

{
  "commandToExecute": "powershell -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature Web-Server -IncludeManagementTools\""
}

SETTINGS

}