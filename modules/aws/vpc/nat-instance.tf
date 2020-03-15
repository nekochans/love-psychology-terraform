resource "aws_security_group" "nat_instance" {
  name = lookup(
    var.nat_instance,
    "${terraform.workspace}.name",
    var.nat_instance["default.name"]
  )
  description = "Security Group to ${lookup(
    var.nat_instance,
    "${terraform.workspace}.name",
    var.nat_instance["default.name"]
  )}"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = lookup(
      var.nat_instance,
      "${terraform.workspace}.name",
      var.nat_instance["default.name"]
    )
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_iam_policy_document" "nat_instance_trust_relationship" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "nat_instance_role" {
  name               = "${terraform.workspace}-love-psychology-nat-instance-default-role"
  assume_role_policy = data.aws_iam_policy_document.nat_instance_trust_relationship.json
}

resource "aws_iam_role_policy_attachment" "attachment_amazon_ec2_role_for_ssm" {
  role       = aws_iam_role.nat_instance_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_instance_profile" "nat_instance_profile" {
  name = "${terraform.workspace}-love-psychology-nat-instance-profile"
  role = aws_iam_role.nat_instance_role.name
}

resource "aws_instance" "nat_instance_1c" {
  ami = lookup(
    var.nat_instance,
    "${terraform.workspace}.ami",
    var.nat_instance["default.ami"]
  )
  associate_public_ip_address = true
  instance_type = lookup(
    var.nat_instance,
    "${terraform.workspace}.instance_type",
    var.nat_instance["default.instance_type"]
  )

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = lookup(
      var.nat_instance,
      "${terraform.workspace}.volume_type",
      var.nat_instance["default.volume_type"]
    )
    volume_size = lookup(
      var.nat_instance,
      "${terraform.workspace}.volume_size",
      var.nat_instance["default.volume_size"]
    )
  }

  subnet_id              = aws_subnet.public_1c.id
  vpc_security_group_ids = [aws_security_group.nat_instance.id]

  tags = {
    Name = "${lookup(
      var.nat_instance,
      "${terraform.workspace}.name",
      var.nat_instance["default.name"]
    )}-1c"
  }

  iam_instance_profile = aws_iam_instance_profile.nat_instance_profile.name
  monitoring           = true
  source_dest_check    = false

  lifecycle {
    ignore_changes = all
  }
}
