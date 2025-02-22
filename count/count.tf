resource "null_resource" "test"{
  count =length(var.count1)
  
  provisioner "local-exec" {
  command = "echo ${var.count1[count.index]}"  
  
  }  
}

variable "count1" {
  default = ["red","apple","banna","ornage","green"] 
}

resource "local_file" "foo" {
  count = length(var.list)

  content  = "${var.list[count.index]}"
  filename = "/tmp/file-${count.index}"
}


variable "list" {
  default = ["rashmika","kishore","manoj"]
}