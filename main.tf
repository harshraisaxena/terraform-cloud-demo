provider "aws" {
  region = "us-east-1"
}

# AMI for t2.micro (Amazon Linux 2)
data "aws_ami" "t2_ami" {
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

# AMI for t3.micro (Amazon Linux 2023)
data "aws_ami" "t3_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# EC2 instance using t2.micro with 5 tags
resource "aws_instance" "myec2_t2" {
  ami           = data.aws_ami.t2_ami.id
  instance_type = "t2.micro"

  tags = {
    Name        = "T2MicroInstance"
    Environment = "Development"
    Owner       = "Harsh"
    Project     = "TerraformDemo"
    Purpose     = "Testing"
  }
}

# EC2 instance using t3.micro without tags
resource "aws_instance" "myec2_t3" {
  ami           = data.aws_ami.t3_ami.id
  instance_type = "t3.micro"
}
