terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.4.6"
}

provider "aws" {
  region  = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0607784b46cbe5816"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}

