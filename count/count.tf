resource null_resource "test"{
    count =length(var.count)
}

variable "count" {
  default = ["banna","ornage"] 

}