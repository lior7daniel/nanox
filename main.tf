provider "aws" {
  region = var.region
}

resource "aws_instance" "k8s" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = file("user-data.sh")

  tags = {
    Name = "nanox"
  }
}

output "instance_ip" {
  value = aws_instance.k8s.public_ip
}
