resource "null_resource" "test"{
  count =length(var.count1)
  
  provisioner "local_exec" {
  command = "echo ${var.count1[count1.index]}"  
  
  }  
}

variable "count1" {
  default = ["banna","ornage"] 

}