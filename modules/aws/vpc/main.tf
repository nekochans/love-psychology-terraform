resource "aws_vpc" "vpc" {
  cidr_block           = lookup(var.vpc, "${terraform.workspace}.cidr", var.vpc["default.cidr"])
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = lookup(var.vpc, "${terraform.workspace}.name", var.vpc["default.name"])
  }
}
