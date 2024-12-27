provider "aws" {
    region = "eu-west-2"
}

variable "environment" {
    type = string
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    count = var.environment == "prod" ? 1 : 0
    // if variable is equal to prod, set the value to 1 (create 1 ec2 instance)
    // if variable is not equal to prod, don't create anything
}