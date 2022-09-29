variable "location" {
    default = "uksouth"  
}

variable "tags" {
    type = map(string)
    default = {
      "source" = "terra"
      "mytags" = "ravi"
    }
}

variable "rg_name" {
    default = "ravi_module_rg"
}