provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "https://172.174.242.161:8200"
  token   = var.token
}

data "vault_kv_secret" "secret_data" {
  path = "/test/data/demo-ssh"
}

variable "token"{}
