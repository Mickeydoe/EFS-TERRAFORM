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
  
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_igw"
  }
}


resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "public_rt"
    }
}

resource "aws_route_table_association" "route_assoc1" {
  subnet_id      = aws_subnet.my_subnet1.id
  route_table_id = aws_route_table.route1.id
}

resource "aws_route_table_association" "route_assoc2" {
  subnet_id      = aws_subnet.my_subnet2.id
  route_table_id = aws_route_table.route2.id
}