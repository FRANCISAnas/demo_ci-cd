locals {
  count = 0 # Если вводить данную переменную, нам приходиться хардкодить с subnet_id, так как раньше subnet_id выбирался из count в котором была привязка в Subnet.

  # Нам не нужно использовать структуру subnet_id[0] если вводить count, который считает количество Subnet
  # count = length(var.public_subnet)
  # subnet_id = var.subnet_id[count.index]
}
resource "aws_instance" "app" {
  count                  = local.count
  ami                    = data.aws_ami.ubuntu.id                         # ubuntu 16.04
  instance_type          = var.instance_type                              # instant params
  subnet_id              = var.subnet_id[0]                               # attach EC2 to subnet
  vpc_security_group_ids = var.sg_id.*.id                                 # attach sec group
  key_name               = var.ssh_key                                    # key for SSH connection
  user_data              = file("./modules/ec2/shell/password_config.sh") # install apache

  tags = {
    Name        = "Web-application"
    AZ          = "${var.availability_zone.names[0]}"
    Owner       = "Student"
    Environment = var.env
  }
}

resource "aws_instance" "jenkins" {
  count                  = local.count
  ami                    = data.aws_ami.ubuntu.id                        # ubuntu 16.04
  instance_type          = var.instance_type                             # instant params
  subnet_id              = var.subnet_id[1]                              # attach EC2 to subnet
  vpc_security_group_ids = var.sg_id.*.id                                # attach sec group
  key_name               = var.ssh_key                                   # key for SSH connection
  user_data              = file("./modules/ec2/shell/jenkins_config.sh") # install apache

  tags = {
    Name        = "Jenkins"
    AZ          = "${var.availability_zone.names[1]}"
    Owner       = "Student"
    Environment = var.env
  }
}
