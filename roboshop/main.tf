module "frontend" {
  for_each = var.components  
  source = "./module"
  component = each.value ["name"]
  vmsize    = each.value["vmsize"]

}
 
variable "components" {
   default = {
    frontend ={
       name = "cataalogue"
       vmsize = "Standard_DS1_v2" 
    }
   } 
}

variable "components" {
   default = {
    frontend ={
       name = "mongo"
       vmsize = "Standard_DS1_v2" 
    }
   } 
}


