module "resource_group" {

  source = "./modules/resource-group"

  name = "rg-${var.project_name}-${var.environment}"

  location = var.location

<<<<<<< HEAD
 
=======
>>>>>>> 77a15b98cfda52781e0eb33af55daa5191a8e0cf

}

module "network" {

  source = "./modules/network"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  vnet_name = "vnet-${var.project_name}-${var.environment}"
  vnet_cidr = "10.10.0.0/16"

  app_subnet_name = "snet-app"
  app_subnet_cidr = "10.10.1.0/24"

  public_ip_name = "pip-${var.project_name}-${var.environment}"

  tags = local.common_tags
}



module "nsg" {

  source = "./modules/nsg"

  nsg_name = "nsg-${var.project_name}-${var.environment}"

  resource_group_name = module.resource_group.name

  location = module.resource_group.location

  subnet_id = module.network.app_subnet_id

  tags = local.common_tags
}

module "windows_vm" {

  source = "./modules/windows-vm"

  depends_on = [
    module.resource_group,
    module.network,
    module.nsg
  ]

  vm_name       = "vm-${var.project_name}-${var.environment}"
  computer_name = "winvm01"

  location = module.resource_group.location

  resource_group_name = module.resource_group.name

  subnet_id = module.network.app_subnet_id

  public_ip_id = module.network.public_ip_id

  vm_size = "Standard_D2s_v3"

  admin_username = var.admin_username

  admin_password = var.admin_password

  tags = local.common_tags

}