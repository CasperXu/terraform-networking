variable "vpc" {
  type = object({
    cidr            = string
    public_subnets  = list(string)
    private_subnets = list(string)
  })
}

variable "ec2" {
  type = object({
    public_subnet_ips   = list(string)
    private_subnets_ips = list(string)
  })
}
