resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
  # this ec2 instance is dependent on sg
  # first terraform will create sg and give sg id to ec2 instance
  # after creation terraform will be assigning sg to ec2
  # this is called automatic dependency management

  tags = {
    Name = "terraform"
    Project= "Roboshop"
  }
}

resource "aws_security_group" "allow_tls" { # allow_tls name is for terraform
  name        = "allow-all-terraform" # this name is for AWS account
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress { # outbound rule in security group
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress { # inbound rule in security group
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-terraform"
  }
}