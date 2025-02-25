variable "a"{}

output "var"{
  value = var.a > 10 ? 11 : 9  
}


resource "null_resource" "resource"{
  count = var.a > 10 ? 1 : 0  
}
