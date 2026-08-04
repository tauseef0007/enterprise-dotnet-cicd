terraform {

  required_version = ">=1.6.0"

  required_providers {

    azurerm = {

      source = "hashicorp/azurerm"

      version = "~>4.0"

    }

  }

}

provider "azurerm" {

  features {}
  subscription_id = "8b70ac04-5701-4f53-8bcc-09715d9ed688"
}