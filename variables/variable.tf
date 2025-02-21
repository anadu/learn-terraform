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
