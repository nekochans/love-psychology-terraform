resource "aws_subnet" "public_1a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(
    var.vpc,
    "${terraform.workspace}.public_1a",
    var.vpc["default.public_1a"]
  )
  availability_zone = var.vpc["default.az_1a"]

  tags = {
    Name = "${terraform.workspace}-love-psychology-public-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(
    var.vpc,
    "${terraform.workspace}.public_1c",
    var.vpc["default.public_1c"]
  )
  availability_zone = var.vpc["default.az_1c"]

  tags = {
    Name = "${terraform.workspace}-love-psychology-public-1c"
  }
}

resource "aws_subnet" "public_1d" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(
    var.vpc,
    "${terraform.workspace}.public_1d",
    var.vpc["default.public_1d"]
  )
  availability_zone = var.vpc["default.az_1d"]

  tags = {
    Name = "${terraform.workspace}-love-psychology-public-1d"
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(
    var.vpc,
    "${terraform.workspace}.private_1a",
    var.vpc["default.private_1a"]
  )
  availability_zone = var.vpc["default.az_1a"]

  tags = {
    Name = "${terraform.workspace}-love-psychology-private-1a"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(
    var.vpc,
    "${terraform.workspace}.private_1c",
    var.vpc["default.private_1c"]
  )
  availability_zone = var.vpc["default.az_1c"]

  tags = {
    Name = "${terraform.workspace}-love-psychology-private-1c"
  }
}

resource "aws_subnet" "private_1d" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(
    var.vpc,
    "${terraform.workspace}.private_1d",
    var.vpc["default.private_1d"]
  )
  availability_zone = var.vpc["default.az_1d"]

  tags = {
    Name = "${terraform.workspace}-love-psychology-private-1d"
  }
}
