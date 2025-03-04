provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "http://172.203.217.40:8200"
  token   = var.token
}

variable "token" {}

module "vault" {
  source = "./create-secrets"
  for_each = var.secrets 
  kv_path = each.key
  secrets = each.value
}


variable "secrets" {
  default = {
    infra = {
     ssh = {
       admin_username = "roboshop-ansible",
       admin_password = "DevOps@123456"
    }   
  }  
}
}