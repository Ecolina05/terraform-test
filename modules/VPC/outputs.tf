output "vpc_id" {
  value = aws_vpc.vpc_itm_VPC_MODULE.id

  description = "VPC ID"
}

output "subnet_id" {
  value = aws_subnet.subnet_itm_VPC_MODULE_1

  description = "SUBNET ID"
}
