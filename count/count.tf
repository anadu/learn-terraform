resource "null_resource" "test"{
  count =length(var.count1)
  
  provisioner "local-exec" {
  command = "echo ${var.count1[count.index]}"  
  
  }  
}

variable "count1" {
  default = ["banna","ornage"] 

}

output "check" {
  value = null_resource.test
}