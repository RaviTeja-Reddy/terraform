variable "account_tier" {
  default = "Standard"
}

variable "st_name" {
  default     = "ravirgstorage1212"
}

variable "location" {
  default     = "uksouth"
}

variable "tags" {
  type        = map(string)
  default = {
    "mytag"  = "ravi"
    "source" = "terraform"
  }

}
variable "resource_group_name" {
  default     = ""
}

variable "account_replication_type" {
  default = "GRS"
}