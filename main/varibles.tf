variable "st_name" {
    default = "ravistorage6789"
  
}
variable "rg_name" {
    default = "ravi-resource"
  
}
variable "location" {
    default = "uksouth"
  
}
variable "sp_name" {
    default = "ravisapp_1212"
  
}
variable "fapp_name" {
    default = "ravifapp"
  
}
variable "primary_access_key" {
    default = "raviaccesskey"
}
variable "tags" {
    type = map(string)
    default = {
      "env" = "dev"
      "source" = "terraform"
      "demo" = "ravi"
    }
  
}