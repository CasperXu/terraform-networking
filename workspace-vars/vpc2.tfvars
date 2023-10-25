vpc = {
  cidr            = "10.9.0.0/16"
  public_subnets  = ["10.9.1.0/24"]
  private_subnets = ["10.9.2.0/24"]
}

ec2 = {
  public_subnet_ips   = ["10.9.1.50"]
  private_subnets_ips = ["10.9.2.50"]
}