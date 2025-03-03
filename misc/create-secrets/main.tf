resource "vault_mount" "kvv1" {
  path        = var.kv_path
  type        = "kv"
  options     = { version = "1" }
  description = var.kv_path
}




variable "kv_path"{}