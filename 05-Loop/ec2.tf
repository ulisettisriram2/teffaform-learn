resource "aws_instance" "test" {
    #count = 5
    count = length(var.instances)
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium" 
    ami = var.amiid
    # name = "${var.project}-${var.environment}-ec2"
    tags = {
        Name = "${var.project}-${var.environment}-${var.instances[count.index]}-${count.index}"
    }
}

