provider "aws" {
  region = "us-east-1"
}

# Shared AMI for both t2.micro and t2.nano
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# EC2 instance using t2.micro
resource "aws_instance" "myec2_micro" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
}

# EC2 instance using t2.nano
resource "aws_instance" "myec2_nano" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.nano"
}
