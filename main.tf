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
  region = "us-east-2"
}

// Create an EC2 instance
/*
  - Name your resources appropriately and use descriptive names
  - Use a key pair that you have created in the AWS Management Console
  - Use the `t2.micro` instance type
  - Use the latest Amazon Linux 2 AMI for your region (hardcode the AMI ID)
  - Use the default VPC for your region
*/

resource "aws_instance" "rico-ec2-deploy" {
  ami           = "ami-06d5c50c30a35fb88"
  instance_type = "t2.micro"
  key_name      = "rico-ec2kp"
  security_groups = ["rico-spring-boot"]
  tags = {
    Name = "rico-ec2-deploy" 
  }
}




// Create a security group for the EC2 instance
/*
  - Name your resources appropriately and use descriptive names
  - Use a Security Group that allows SSH access from anywhere
*/