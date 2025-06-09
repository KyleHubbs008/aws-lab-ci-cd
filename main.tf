# AWS provider and region
provider "aws" {
	region = "us-east-1"
}

# VPC for the home lab
resource "aws_vpc" "homelab_vpc" {
	cidr_block = "10.0.0.0/16"
	enable_dns_support   = true
	enable_dns_hostnames = true
	tags = {
		Name = "HomeLabVPC"
	}
}

# Public subnet within the VPC
resource "aws_subnet" "public_subnet" {
	vpc_id                   = aws_vpc.homelab_vpc.id
	cidr_block               = "10.0.1.0/24"
	map_public_ip_on_launch  = true
	availability_zone        = "us-east-1a"
	tags = {
		Name = "PublicSubnet"
	}
}

# Security group for the web server
resource "aws_security_group" "web_sg" {
	name         = "WebServerSG"
	description  = "Security group for web server lab"
	vpc_id       = aws_vpc.homelab_vpc.id
	
	# Allow SSH access from your home PC
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["108.39.96.104/32"] 
	}
	
	# Allow HTTP access from anywhere
	ingress {
		from_port    = 80
		to_port      = 80
		protocol     = "tcp"
		cidr_blocks  = ["0.0.0.0/0"]
	}
	
	# Allow all outbound traffic
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1" # All protocols
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	tags = {
		Name = "WebServerSG"
	}
}

# EC2 instance for the web server
resource "aws_instance" "web_server" {
	ami = "ami-02457590d33d576c3"
	instance_type = "t2.micro"
	subnet_id = aws_subnet.public_subnet.id
	key_name = "HomeLabKey"
	vpc_security_group_ids = [aws_security_group.web_sg.id]
	tags = {
		Name = "WebServerLab"
	}
}