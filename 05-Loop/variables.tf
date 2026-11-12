variable "amiid" {
   type = string
}
variable "instancetype" {
    type = string
}
variable "environment" {
    type = string
}

variable "project" {
    type = string
}

variable "instances" {
    type = list
    default = ["sriram","swetha","shiva","sunitha"]
}