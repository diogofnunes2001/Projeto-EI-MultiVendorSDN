resource "aws_instance" "mvsdn-web-server" {
  ami           = "ami-0ace28e4cd033b81c"
  instance_type = "t3.micro"
  #subnet_id     = aws_subnet.mvsdn-mikrotik-subnet.id
  tags = {
    Name = "mvsdn-linux"
  }
}
