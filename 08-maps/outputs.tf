output "ec2_info" {
    value = {
        public_ip = aws_instance.test[*].public_ip
        private_ip = aws_instance.test[*].private_ip
        Name = aws_instance.test[*].tags.Name
        SG_Name = aws_security_group.web[*].tags.Name
    }
}