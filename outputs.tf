output "public_subnet_ip" {
  value = aws_eip.one.public_ip
}

output "acl_arn" {
  value = aws_network_acl.public.arn
}

# output "json_fmt_test" {
#   value = data.aws_iam_policy_document.s3_vpce.json
# }

# output "vpc_endpoint_id" {
#   value = aws_vpc_endpoint.s3.id 
# }