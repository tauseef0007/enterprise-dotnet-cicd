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

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

