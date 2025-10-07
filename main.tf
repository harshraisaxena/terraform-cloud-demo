provider "aws" {
region = "us-east-1"

}


resource "aws_instance" "myec2" {
  ami    = ami-052064a798f08f0d3 
  instance_type = "t3.micro"

}

resource "aws_instance" "myec2-2" {
  ami    = ami-052064a798f08f0d3 
  instance_type = "t3.micro"

}
