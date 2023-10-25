resource "aws_vpc" "this" {
  cidr_block = var.vpc.cidr

  tags = {
    Name = "terry-test-networking"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id          = aws_vpc.this.id
  service_name    = "com.amazonaws.us-east-1.s3"
  auto_accept     = true
  route_table_ids = [aws_route_table.public.id]
  // vpc_endpoint_type: default to gateway
  tags = {
    Name = "terry-vpc-endpoint"
  }
}
