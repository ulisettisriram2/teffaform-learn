resource "aws_instance" "test" {
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium" 
    ami = var.amiid
}