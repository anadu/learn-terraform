variable "a"{}

output "condition" {
  value = var.a < 10 ? "a is greater than 20" : "a is less than 10"
}

resource "null_resource" "resource"{
  count = var.a = 10 ? 1 : 0  
}
