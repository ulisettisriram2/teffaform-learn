resource "aws_instance" "test" {
    #count = 5
    count = length(var.instances)
    instance_type = var.instancetype
    ami = var.amiid

    tags = merge (
        var.common_tags,
        {
            Name = "${var.instances[count.index]}-${var.common_tags.environment}-${var.common_tags.project}"
        }
    )
}

resource "aws_security_group" "web"{
    count = length(var.instances)
    #name = "Instance:${var.instances[count.index]}-Environment:${var.environment}-Project:${var.project}"
    description = "test loop and validations"
    ingress{
        from_port   = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        from_port   = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]   
    }
    tags = merge (
        var.common_tags,
        {
            Name = "${var.instances[count.index]}-${var.common_tags.environment}-${var.common_tags.project}-SG"
        }
    )
}

