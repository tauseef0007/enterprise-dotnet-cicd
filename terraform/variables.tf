
variable "location" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}



variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}