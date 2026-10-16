provider "aws" {
  region = "ap-southeast-3"
}

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "my_server" {
  ami           = data.aws_ami.al2023.id
  instance_type = "t3.micro"  # free tier eligible in ap-southeast-3 (Jakarta)

  tags = {
    Name = "learn-terraform"
  }
}
