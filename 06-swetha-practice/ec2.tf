
resource "aws_instance" "web" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-ec2"
  }
}