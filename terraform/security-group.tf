resource "aws_security_group" "sg" {
  name        = "Sec-group"
  description = "Security group for Password Generator"

  ingress {
    description = "Allow traffic to ssh only for jenkins machine"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["X.X.X.X/32"]
  }

  ingress {
    description = "Allow all traffic to HTTP port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_22-80"
  }
}
