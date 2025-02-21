module "calling" {
  source = "./sample"
  x = var.x
  y = var.y
}

variable "x"{}
variable "y" {}