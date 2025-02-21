resource null_resource "test"{
  count =length(var.count1)
}

variable "count1" {
  default = ["banna","ornage"] 

}