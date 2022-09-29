variable "rg_name" {
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