resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

     tags = {
    Name = "my_vpc"
  }
}


resource "aws_subnet" "my_subnet1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
    Name = "my_subnet1"
  }
  
}

resource "aws_subnet" "my_subnet2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"

    tags = {
    Name = "my_subnet2"
  }
}
  
