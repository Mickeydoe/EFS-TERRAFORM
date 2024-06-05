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



resource "aws_instance" "Server_1" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_subnet1.id  
  user_data = 
  vpc_security_group_ids = [aws_security_group.allow_nfs.id]
  
  

  tags = {
    Name = "Server_1"
  }
}

resource "aws_instance" "Server_2" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_subnet2.id
  vpc_security_group_ids = [ aws_security_group.allow_nfs.id ]
  

  tags = {
    Name = "Server_2"
  }
}