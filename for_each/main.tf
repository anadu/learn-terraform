resource "local_file" "foo" {
 for_each = var.list

  content  = each.value
  filename = "/tmp/${each.key}"
}


variable "list" {
  default = {
    ornage = "ORANGE"
    apple = "APPLE"

  }
}