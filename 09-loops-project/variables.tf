variable "common_tags" {
    default = {
        project = "EcomStore"
        environment = "dev"
        Terraform = "true"
    }
}

variable "instances" {
    type = list
    default = ["Tech","Sales"]
}

variable "instancetype" {
    type = string
}

variable "amiid" {
    type = string
}