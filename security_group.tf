resource "aws_security_group" "rdp" {
  name        = "RDP"
  description = "terraform import security group"
  tags = {
    Name = "RDP SG"
  }

  ingress {
    from_port   = 3389
    protocol    = "tcp"
    to_port     = 3389
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
