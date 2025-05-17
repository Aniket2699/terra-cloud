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
  region = var.region
access_key = var.access_key
secret_key = var.secret_key
}
variable "region" {
  default = "us-east-1"
}
variable "ami_id" {
  default = "ami-084568db4383264d4"
}
variable "ins_type" {
  default = "t2-micro"
}
resource "aws_instance" "appec2" {
  ami           =  var.ami_id
  instance_type = var.ins_type
tags = {
    Name = "app-instance"
}
}
