module "resource_group" {

  source = "./modules/resource-group"

  name = "rg-${var.project_name}-${var.environment}"

  location = var.location

  tags = local.common_tags

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