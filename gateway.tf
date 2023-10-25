resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "terry-main"
  }
}

resource "aws_eip" "nat_gateway" {
  domain = "vpc"
}

resource "aws_nat_gateway" "public_subnet" {
  allocation_id     = aws_eip.nat_gateway.id
  subnet_id         = aws_subnet.public_subnet.id
  connectivity_type = "public"

  tags = {
    Name = "terry-nat-gateway"
  }
}