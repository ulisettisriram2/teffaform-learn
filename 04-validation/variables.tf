variable "amiid" {
   type = string
}
variable "instancetype" {
    type = string
 #   default = "t3.small"
  #  validation {
   #     condition = contains(["t3.micro","t3.small","t3.medium"],var.instancetype)
    #    error_message = "Instance should be micro,small or medium "
    #}
}
variable "environment" {
    type = string
}