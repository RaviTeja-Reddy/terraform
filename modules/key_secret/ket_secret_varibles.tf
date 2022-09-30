variable "secret_name" {
    default = "default-secret-name"
    type = string
  
}
variable "secret_names" {
    type = map(string)
    default = {
      "" = ""
    }
  
}
variable "secret_value" {
    default = "default-secret-value"
    type = string
  
}
variable "key_vault_id" {
    default = "kv_id"
    type = string
  
}
