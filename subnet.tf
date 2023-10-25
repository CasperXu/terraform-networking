resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.vpc.public_subnets[0]
  availability_zone = "us-east-1a"

  tags = {
    Name = "terry-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.vpc.private_subnets[0]
  availability_zone = "us-east-1b"

  tags = {
    Name = "terry-private-subnet"
  }
}

resource "aws_network_interface" "public_server" {
  subnet_id       = aws_subnet.public_subnet.id
  private_ips     = var.ec2.public_subnet_ips
  security_groups = [aws_security_group.public.id]
}

resource "aws_network_interface" "private_server" {
  subnet_id       = aws_subnet.private_subnet.id
  private_ips     = var.ec2.private_subnets_ips
  security_groups = [aws_security_group.private.id]
}

resource "aws_eip" "one" {
  domain = "vpc"
  # instance = aws_instance.public.id
  network_interface         = aws_network_interface.public_server.id
  associate_with_private_ip = var.ec2.public_subnet_ips[0]

  depends_on = [aws_internet_gateway.gw]
}

