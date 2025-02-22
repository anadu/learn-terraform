module "frontend" {
  for_each = var.components  
  source = "./module"
  component = each.value ["name"]
  vmsize    = each.value["vmsize"]

}
 
variable "components" {
   default = {
    frontend = {
       name = "frontend"
       vmsize = "Standard_DS1_v2" 
    }
   
    mongo = {
      name = "catalogue"
      vmsize = "Standard_DS1_v2" 
    }
}

