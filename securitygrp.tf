resource "aws_security_group" "allow_nfs" {
  name        = "allow_nfs"
  description = "Allow NFS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "ssh"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "http"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

   ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_nfs"
  }
}

 

