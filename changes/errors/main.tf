provider "aws" {
    region = "eu-west-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = var.type // declare a variable that doesn't exist
}