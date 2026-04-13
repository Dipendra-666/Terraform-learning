variable "environment" {
    type = string
    description = "the env type"
    default = "staging"     
}

variable "storage_disk" {
    type = number
    description = "storage_disk of the vm"
    default = 1
  
}

variable "is_delete" {
    type = bool
    description = "delete os disk when vm is deleted"
    default = true
  
}

variable "allowed_locations" {
    type = list(string)
    description = "list of location to choose from"
    default = [ "eastus", "centralindia", "westeurope" ]
  
}

variable "resource_tag" {
    type = map(string)
    description = "tags apply to the resources"
    default = {
        environment = "staging"
        owner = "dipendra"
        project = "terraform learning"
    }
  
}

variable "network_config" {
    type = tuple([ string, string, number ])
    description = "Network configuration (VNET address, subnet address)"
    default = [ "10.0.0.0/16", "10.0.2.0", 24 ]  
  
}


variable "allowed_vm_sizes" {
    type = list(string)
    description = "allowed vm sizes"
    default = [ "Standard_DS1_v2", "Standard_DS2_v2", "Standard_DS3_v2" ]
  
}