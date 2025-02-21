 variable "a1" {
   default = "kishore"
 }

 output "variabl1"{
    value = var.a1
 }

 variable "a2" {
   default = 10

 }

 variable "boolean" {
    default = true
 }

#string requires only quotes ,that to be double quotes .there is no single quote

output "a2" {
  value = var.a2
}

output "boolean" {
  value = var.boolean
}

# data types
# string
# number
# boolean

#varaibles types
#plain
#list
#map

variable "list" {
  default = ["kishore",2,true]
  
}

output "list" {
  value = var.list[1]
}

variable "map" {
  default = {
    coure = "devops"
    cloud = "azure"
  }
}

output "map" {
  value = var.map["cloud"]
}