variable "storage_account_name" {
    default = ""
  
}
variable "account_tier" {
    default = "Standard"
  
}
variable "account_replication_type" {
    default = "GRS"
  
}
variable "resource_group_name" {
    default = ""
  
}
variable "location" {
    default = ""
  
}
variable "tags" {
    type = map(string)
    default = {
      "env" = "dev"
    }
  
}