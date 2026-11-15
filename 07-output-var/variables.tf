variable "instances" {
    type = list
    default = ["Tech","Sales","HR","Transport"]
}

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

variable "zone_id" {
    default = "Z0126274QL6FM81U4SXX"
}

variable "domain_name" {
    default = "thorams.store"
}