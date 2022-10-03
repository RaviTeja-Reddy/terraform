variable "secret_name" {
    default = "default-secret-name"
  
}
variable "secret_names" {
    type = map(string)
    default = {
      "" = ""
    }
}
variable "secret_values" {
    default = "default_secret_value"
  
}
variable "key_vault_id" {
    default = "kv_id"
  
}