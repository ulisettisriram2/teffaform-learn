resource "aws_instance" "test" {
    instance_type = var.instancetype
    ami = var.amiid
}