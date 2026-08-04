module "windows_vm" {

  source = "./modules/windows-vm"

  vm_name             = "vm-enterprise-dev"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  subnet_id    = module.network.app_subnet_id
  public_ip_id = module.network.public_ip_id

  vm_size = "Standard_B2s"

  admin_username = var.admin_username
  admin_password = var.admin_password
}

module "resource_group" {

  source = "./modules/resource-group"

  name = "rg-${var.project_name}-${var.environment}"

  location = var.location

  tags = local.common_tags

}