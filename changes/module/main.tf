provider "aws" {
    region = "eu-west-2"
}

module "ec2" {
    source = "./ec2"
    for_each = toset(["dev", "test", "prod"]) // count deprecated
    // loop: create 3 instances named dev, test, prod
}