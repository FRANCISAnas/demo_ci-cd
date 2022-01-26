# Environment
variable "env" {
  default = "dev"
}
# Instance type
variable "instance_type" {
  default = "t2.micro"
}
# SSH key
variable "ssh_key" {
  default = "password-generator"
}
# CIDR public subnet
variable "public_subnet" {
  type = list(any)
}
# Public subnet ID
variable "subnet_id" {
  type = list(any)
}
# SG
variable "sg_id" {
  type = any
}
# IGW
variable "igw" {}
# Availability zone
variable "availability_zone" {}
