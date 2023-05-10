terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  // Change if you want to use a different AWS region
  region = "us-east-1"
}

resource "aws_instance" "rico-ec2-deploy" {
  ami           = "ami-06d5c50c30a35fb88"
  instance_type = "t2.micro"
  key_name      = "rico-kp-ec2"
  security_groups = ["rico-security-kp"]
}



# Create a security group to allow SSH access
resource "aws_security_group" "rico-security-kp" {
  name = "rico-security-group"
  ingress {
    description = "Allow SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "Allow HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}


