// Create elastic IP (EIP)
// Public IP: changing IP address when EC2 instance restarted
// EIP: public IP available to attach to EC2 instance (by passing Ec2 instance ID)

provider "aws" {
    region = "eu-west-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
    instance = aws_instance.ec2.id // resource, resource name, attribute
}

output "EIP" {
    value = aws_eip.elasticeip.public_ip
}
// To run instance