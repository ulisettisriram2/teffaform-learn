variable "amiid" {
   type = string
}
variable "instancetype" {
    type = string
    validation{
        condition = contains(["t3.micro","t3.medium","t3.small"],var.instancetype)
        error_message = "instance should be micro,small or medium"
    }
}
variable "environment" {
    type = string
        validation{
        condition = contains(["dev"],var.environment)
        error_message = "instance should be dev"
        }
}

variable "project" {
    type = string
}

variable "instances" {
    type = list
    #default = ["sriram","swetha","shiva","sunitha"]
}