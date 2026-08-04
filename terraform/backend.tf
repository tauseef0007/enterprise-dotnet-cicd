terraform {

  backend "azurerm" {

    resource_group_name = "rg-tfstate-prod"

    storage_account_name = "tfstate123mtk"

    container_name = "tfstate"

    key = "dev.terraform.tfstate"

    use_oidc = true

  }

}