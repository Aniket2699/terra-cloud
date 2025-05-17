terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
#app-instance
resource "aws_instance" "appec2" {
  ami           =  "mi-084568db4383264d4"
  instance_type = "t2-micro"
  count = 2

tags = {
    Name = "app-instance $(count.index+!)"
}
}
