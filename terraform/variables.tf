variable "subscription_id" {
  type = string
}

variable "location" {
  default = "Central India"
}

variable "project_name" {
  default = "enterprise-bank"
}

variable "environment" {
  default = "dev"
}



variable "name" {
  description = "Resource Group Name"
  type        = string
}



variable "tags" {
  description = "Resource Group Tags"
  type        = map(string)

  default = {}
}