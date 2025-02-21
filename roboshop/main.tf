module "frontend" {
  source = "./module"
  component = var.component

}

variable "component" {
  default = "frontend"

}