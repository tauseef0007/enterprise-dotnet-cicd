resource "azurerm_network_interface" "this" {

  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {

    name = "internal"

    subnet_id = var.subnet_id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = var.public_ip_id

  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "this" {

  name          = var.vm_name
  computer_name = var.computer_name

  location = var.location

  resource_group_name = var.resource_group_name

  size = var.vm_size

  admin_username = var.admin_username

  admin_password = var.admin_password

  network_interface_ids = [

    azurerm_network_interface.this.id

  ]

  provision_vm_agent = true



  patch_mode = "AutomaticByOS"

  os_disk {

    caching = "ReadWrite"

    storage_account_type = "StandardSSD_LRS"

  }

  source_image_reference {

    publisher = "MicrosoftWindowsServer"

    offer = "WindowsServer"

    sku = "2022-datacenter-azure-edition"

    version = "latest"

  }

  identity {

    type = "SystemAssigned"

  }

  boot_diagnostics {
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "iis" {

  name                 = "Install-IIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.this.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
{
  "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeManagementTools"
}
SETTINGS

  depends_on = [
    azurerm_windows_virtual_machine.this
  ]
}
