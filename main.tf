terraform {
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

resource "aws_instance" "Server1" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id = aws_subnet.my_subnet1.id
  user_data = file("userdata.sh")
  vpc_security_group_ids = [aws_security_group.allow_nfs.id]
  
  tags = {Name = "Server1"}
}

resource "aws_instance" "Server2" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  subnet_id = aws_subnet.my_subnet2.id
  user_data = file("userdata.sh")
  vpc_security_group_ids = [aws_security_group.allow_nfs.id]
  
  tags = {Name = "Server2"}
}