provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "http://20.124.84.177:8200"
  token   = var.token
}

resource "vault_mount" "main" {
  path        = "secret/foo"
  type        = "kv"
  options     = { version = "1" }
  description = var.kv_path



resource "vault_generic_secret" "example" {
  path = "secret/foo"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}


variable "token"{}
