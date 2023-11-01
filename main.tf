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
resource "aws_instance" "ec2_instance" {
  ami                     = var.ami_id
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [var.security_group_name]
  key_name                = "cjd-tf-keypair"
  iam_instance_profile    = aws_iam_instance_profile.cjd-ec2_instance_profile.id

  tags = {
    Name = "cjd-tf-ec2"
  }
}


// Create iam role
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

// Create iam role policy
resource "aws_iam_role_policy" "ec2_role_policy" {
  name = "ec2_role_policy"
  role = aws_iam_role.ec2_role.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:CreateBucket",
          "s3:DeleteBucket",
          "s3:ListAllMyBuckets"
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}


// associate the ec2 instance with the role
resource "aws_iam_instance_profile" "cjd-ec2_instance_profile" {
  name = "cjd-ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}
