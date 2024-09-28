data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_security_group" "ec2-sg" {
  name        = var.sg_name
  description = "SG para mackenzie"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = var.allowed_ssh_cidr_blocks
      ipv6_cidr_blocks = []          # Adicione um valor vazio
      prefix_list_ids  = []          # Adicione um valor vazio
      security_groups  = []          # Adicione um valor vazio
      self             = false       # Defina como false
    }
  ]

  egress = [
    {
      description      = "Allow all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []          # Adicione um valor vazio
      prefix_list_ids  = []          # Adicione um valor vazio
      security_groups  = []          # Adicione um valor vazio
      self             = false       # Defina como false
    }
  ]

  tags = {
    Name = var.sg_name
  }
}

resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = var.volume_size
    tags = {
      Name = var.volume_name
    }
  }
}
