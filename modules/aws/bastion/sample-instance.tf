// TODO このファイルは動作確認用なので不要になったタイミングで削除する
resource "aws_security_group" "sample" {
  name        = "${terraform.workspace}-sample"
  description = "Security Group sample"
  vpc_id      = var.vpc["vpc_id"]

  tags = {
    Name = "${terraform.workspace}-sample"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ssh_from_bastion" {
  security_group_id        = aws_security_group.sample.id
  type                     = "ingress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion.id
}

resource "aws_instance" "sample_1a" {
  ami = "ami-011facbea5ec0363b"

  instance_type = "t3.micro"

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp2"
    volume_size = "30"
  }

  key_name               = aws_key_pair.ssh_key_pair.id
  subnet_id              = var.vpc["subnet_private_1a_id"]
  vpc_security_group_ids = [aws_security_group.sample.id]

  tags = {
    Name = "${terraform.workspace}-sample-1a"
  }

  lifecycle {
    ignore_changes = all
  }
}
