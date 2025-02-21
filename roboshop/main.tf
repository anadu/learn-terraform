module "frontend" {
  source = "./module"
  component = var.component

}

variable "component" {
  default = "frontend"

}

module "catalogue" {
  source = "./module"
  component = var.component
}

variable "component" {
    default = "catalogue"
}