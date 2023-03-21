locals {
  instance_count          = 2
  interfaces_per_instance = 2
}

resource "aws_vpc" "mvsdn-full-vpc" {
  cidr_block = "192.168.0.0/23"
  tags = {
    Name = "mvsdn-mikrotik-vpc"
  }
}

resource "aws_subnet" "mvsdn-mikrotik-subnet" {
  vpc_id     = aws_vpc.mvsdn-full-vpc.id
  cidr_block = "192.168.0.0/24"
}

resource "aws_subnet" "mvsdn-cisco-subnet" {
  vpc_id     = aws_vpc.mvsdn-full-vpc.id
  cidr_block = "192.168.1.0/24"
}

resource "aws_network_interface" "mvsdn-mikrotik-nic" {
  count     = local.instance_count * local.interfaces_per_instance
  subnet_id = aws_subnet.mvsdn-mikrotik-subnet.id
  attachment {
    instance     = aws_instance.mvsdn-web-server.id
    device_index = 1
  }
}

resource "aws_network_interface" "mvsdn-cisco-nic" {
  count     = local.instance_count * local.interfaces_per_instance
  subnet_id = aws_subnet.mvsdn-cisco-subnet.id
  attachment {
    instance     = aws_instance.mvsdn-web-server.id
    device_index = 1
  }
}
