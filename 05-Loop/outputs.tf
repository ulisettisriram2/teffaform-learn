# 1. Standard Terraform Outputs (Displayed in terminal after apply)
output "ec2_instance_ids" {
  description = "List of all created EC2 Instance IDs"
  value       = aws_instance.test[*].id
}

output "ec2_public_ips" {
  description = "List of public IP addresses for the EC2 instances"
  value       = aws_instance.test[*].public_ip
}

output "ec2_private_ips" {
  description = "List of private IP addresses for the EC2 instances"
  value       = aws_instance.test[*].private_ip
}

output "security_group_ids" {
  description = "List of all created Security Group IDs"
  value       = aws_security_group.web[*].id
}

# 2. Automatic File Export (Creates output.json readable in VS Code)
resource "local_file" "terraform_outputs" {
  filename = "${path.module}/output.json"

  content = jsonencode({
    instances = [
      for idx, instance in aws_instance.test : {
        name              = instance.tags["Name"]
        instance_id       = instance.id
        instance_type     = instance.instance_type
        public_ip         = instance.public_ip
        private_ip        = instance.private_ip
        security_group_id = aws_security_group.web[idx].id
      }
    ]
  })
  # Automatically formats output.json into a readable tree structure on Windows
  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]
    command     = "(Get-Content '${self.filename}' | ConvertFrom-Json | ConvertTo-Json -Depth 10) | Set-Content -Encoding utf8 '${self.filename}'"
  }
}
