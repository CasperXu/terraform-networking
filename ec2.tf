resource "aws_instance" "public" {
  ami               = "ami-053b0d53c279acc90"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "terryhsu"

  // asscociate the instance to a subnet and security groups and private ips
  network_interface {
    network_interface_id = aws_network_interface.public_server.id
    device_index         = 0
  }

  tags = {
    Name = "terry-test-public"
  }
}

resource "aws_instance" "private" {
  ami               = "ami-053b0d53c279acc90"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"
  key_name          = "terryhsu"

  network_interface {
    network_interface_id = aws_network_interface.private_server.id
    device_index         = 0
  }

  tags = {
    Name = "terry-test-private"
  }
}