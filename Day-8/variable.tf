variable "project_name" {
    type = string
    description = "name of the project"
    default = "Project ALPHA Resource"
  
}

variable "default_tags" {
    type = map(string)
    default = {
      company = "CloudOps"
      managed_by = "Terraform"
    }
  
}

variable "environment_tags" {
    type = map(string)
    default = {
      environment = "production"
      cost_center = "cc-123"
    }
  
}

variable "storage_account_name" {
    type = string
    description = "name of the storgae account"
    default = "This should not Be & that long more then twintyfour character"
  
}