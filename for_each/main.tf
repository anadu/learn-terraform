resource "local_file" "foo" {
 for_each = var.list

  content  = each.value["content"]
  filename = "/tmp/${each.key}"
}


variable "list" {
  default = {
    ornage = {
      content = "this is good fruit"  
    }
    apple = {
      content = "this is frest fruit"  
    }

  }
}