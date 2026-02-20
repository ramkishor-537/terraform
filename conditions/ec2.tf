resource "aws_instance" "example" {
  ami           = var.ami_id
  # if dev t3.micro, otherwise t3.small
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
  # this ec2 instance is dependent on sg
  # first terraform will create sg and give sg id to ec2 instance
  # after creation terraform will be assigning sg to ec2
  # this is called automatic dependency management

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_tls" { # allow_tls name is for terraform
  name        = var.sg_name # this name is for AWS account
  description = var.sg_description

  egress { # outbound rule in security group
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress { # inbound rule in security group
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}