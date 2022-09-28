variable "account_tier" {
  default = "Standard"
}

variable "rg_name" {
  description = "Name of the Resource Group"
  default     = "ravi-rg-storage"
}

variable "location" {
  description = "Resource Location"
  default     = "uksouth"
}

variable "tags" {
  description = "Tags for Resources"
  type        = map(string)
  default = {
    "mytag"  = "reddy"
    "source" = "terraform"
  }

}
variable "st_name" {
  description = "Name of the Storage Account"
  default     = "ravistorage3378"
}

variable "account_replication_type" {
  default = "GRS"
}