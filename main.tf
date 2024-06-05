terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.52.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "web" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_subnet1.id  
  

  tags = {
    Name = "Server_1"
  }
}