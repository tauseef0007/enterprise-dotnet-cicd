variable "subscription_id" {}

variable "location" {
  default = "Central India"
}

variable "resource_group_name" {
  default = "rg-tfstate-prod"
}

variable "storage_account_name" {
  default = "sttauseeftfstate01"
}

variable "container_name" {
  default = "tfstate"
}