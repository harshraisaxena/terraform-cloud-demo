provider "aws" {
region = "us-east-1"

}

data "aws_ami" "myami"{

owners = ["amazon"]
most_recent = true

filter {
    name   = "architecture"
    values = ["x86_64"]
  }


}

resource "aws_instance" "myec2" {
  ami    = data.aws_ami.myami.id 
  instance_type = "t2.micro"

}

resource "aws_instance" "myec2" {
  ami    = data.aws_ami.myami.id 
  instance_type = "t2.nano"

}
