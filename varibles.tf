variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "ravi-rg"
}

variable "location" {
  description = "Location Area"
  type        = string
  default     = "uksouth"
}

variable "tags" {
  description = "tag of the resource"
  type        = map(string)
  default = {
    "environment" = "dev"
    "source"      = "terraform"
    "mytag"       = "ravi"
  }
}
variable "org_name" {
    description = "organisation name"
    type = string
    default = "ravi_rg"
  
}
variable "project_name" {
    description = "project name"
    type = string
    default = "ravi"
  
}
