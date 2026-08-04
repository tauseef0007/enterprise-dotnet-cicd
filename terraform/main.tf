module "resource_group" {

  source = "./modules/resource-group"

  name = "rg-${var.project_name}-${var.environment}"

  location = var.location

  tags = local.common_tags

}