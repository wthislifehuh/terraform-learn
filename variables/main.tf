provider "aws" {
  region = "eu-west-2"
}

variable "vpcname" {
  type    = string //datatype ""/ without ""
  default = "myvpc" // value
}

variable "sshport" {
  type    = number  // integer
  default = 22
}

variable "enabled" {
  default = true    // boolean (no type)
}

variable "mylist" { // list
  type    = list(string)    // (datatype)
  default = ["Value1", "Value2"]    //[""], start from 0
}

variable "mymap" {
  type = map    // map= key value pair
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of the VPC" // run terraform plan will prompt to enter a value for this desc
}

// To use variable
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname
    Name = "${var.vpcname}" // string interpolation no longer needed
    Name = var.mylist[] // list
    Name = var.mymap["Key2"]// map
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

// output
output "vpcid" {
    type = aws_vpc.myvpc.id // resource type, resource name, id
}
// Run myvpc variables

variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]
    // Difference betwen tuple and list:
    // tuple: define datatype, can support multiple datatype
    // list: explicitly define value
}

variable "myobject" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "TJ"
    port = [22, 25, 80]
  }
}

