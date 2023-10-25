resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.this.id
  subnet_ids = [aws_subnet.public_subnet.id]

  # ingress {
  #   protocol   = "tcp"
  #   rule_no    = 99
  #   action     = "deny"
  #   cidr_block = "211.22.61.74/32"
  #   from_port  = 80
  #   to_port    = 80
  # }

  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    from_port  = 0
    to_port    = 0
    action     = "allow"
    rule_no    = 1
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "main"
  }
}