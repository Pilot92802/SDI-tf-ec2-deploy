// Create a security group for the EC2 instance
/*
  - Name your resources appropriately and use descriptive names
  - Use a Security Group that allows SSH access from anywhere
*/
resource "aws_security_group" "allow_ssh" {
  name        = var.security_group_name
  description = "Allow SSH inbound traffic"
  vpc_id      = var.default_vpc

  ingress {
    description      = "SSH from VPC"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cjd-allow-ssh"
  }
}