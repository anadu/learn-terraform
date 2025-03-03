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

data "vault_generic_secret" "rundeck_auth" {
  path = "test/kishore"
}
variable "token"{}

resource "local_file" "test" {
  filename = "/tmp/pass"
  content = data.vault_generic_secret.rundeck_auth.data["password"]
}
