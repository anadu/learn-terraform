variable "a"{}



resource "null_resource" "resource"{
  count = var.a == 9 ? 1 : 0  
}
