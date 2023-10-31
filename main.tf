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
  region = var.region
}

// Create an EC2 instance
/*
  - Name your resources appropriately and use descriptive names
  - Use a key pair that you have created in the AWS Management Console
  - Use the `t2.micro` instance type
  - Use the latest Amazon Linux 2 AMI for your region (hardcode the AMI ID)
  - Use the default VPC for your region
*/
resource "aws_instance" "web" {
  ami                     = var.ami_id
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [var.security_group_name]
  key_name                = "cjd-tf-keypair"
  user_data               = file("install-web-server.sh")

  tags = {
    Name = "cjd-tf-ec2"
  }
}


