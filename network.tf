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



# Route Table Definition
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  # Route to allow all outbound traffic through the Internet Gateway
  route {
    cidr_block = "0.0.0.0/0"  # Default route for all outbound traffic
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "my_route_table"
  }
}

# Route Table Association for Subnet 1
resource "aws_route_table_association" "route_assoc1" {
  subnet_id      = aws_subnet.my_subnet1.id
  route_table_id = aws_route_table.my_route_table.id
}

# Route Table Association for Subnet 2
resource "aws_route_table_association" "route_assoc2" {
  subnet_id      = aws_subnet.my_subnet2.id
  route_table_id = aws_route_table.my_route_table.id
}


# resource "aws_route" "r1" {
#   route_table_id            = aws_route_table.route1.id
#   destination_cidr_block    = "10.0.1.0/24"
#   gateway_id = aws_internet_gateway.gw.id
# }

# resource "aws_route" "r2" {
#   route_table_id            = aws_route_table.route1.id
#   destination_cidr_block    = "10.0.2.0/24"
#   gateway_id = aws_internet_gateway.gw.id
# }


# # Route Tables
# resource "aws_route_table" "route1" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block = "10.0.1.0/24"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "route_table1"
#   }
# }

# resource "aws_route_table" "route2" {
#   vpc_id = aws_vpc.my_vpc.id
  

#   route {
#     cidr_block = "10.0.2.0/24"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "route_table2"
#   }
# }

# # Route Table Associations
# resource "aws_route_table_association" "route_assoc1" {
#   subnet_id      = aws_subnet.my_subnet1.id
#   gateway_id = aws_internet_gateway.gw.id
#   route_table_id = aws_route_table.route1.id  # Corrected reference
# }

# resource "aws_route_table_association" "route_assoc2" {
#   subnet_id      = aws_subnet.my_subnet2.id
#   gateway_id = aws_internet_gateway.gw.id
#   route_table_id = aws_route_table.route2.id  # Corrected reference
# }