# Build AWS instance

provider "aws" {
  region = var.default_region # instant region
}

resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.ubuntu.id             # ubuntu 16.04
  instance_type          = var.instance_type                  # instant params
  vpc_security_group_ids = [aws_security_group.sg.id]         # attach sec group
  key_name               = var.ssh_key                        # key for SSH connection
  user_data              = file("./shell/password_config.sh") # initial config

  tags = {
    Name        = "Password generator"
    Owner       = "Student"
    Description = "Password generator in AWS EC2 instance that have CI/CD using Jenkins and Docker"
    Environment = var.env
  }
}
