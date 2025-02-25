variable "a"{}

output "condition" {
  value = var.a ? "a is greater than 20" : "a is less than 10"
}