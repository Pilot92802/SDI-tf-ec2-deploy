variable "bucket_name" {
  description = "name of my s3 bucket"
  type        = string
  default     = "cjd-tf-test-bucket"
}

variable "file_name" {
  description = "name of my upload file"
  type        = string
  default     = "build/libs/sample.txt"
}

variable "region" {
  description = "region name"
  type        = string
  default     = "us-west-1"
}

variable "ami_id"{
    description = "The id of the AMI to use for our new EC2 instance"
    type        = string
    default     = "ami-003946151dbec5c44"
}

variable "default_vpc"{
    description = "default vpc id"
    type        = string
    default     = "vpc-022a2165570ed48d8"
}

variable "security_group_name"{
    description = "name of my new security group"
    type        = string
    default     = "cjd-allow-ssh"
}

variable "ssh_port"{
    description = "ssh port number"
    type        = number
    default     = 22
}