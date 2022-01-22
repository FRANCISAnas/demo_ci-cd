output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "vpc_ip" {
  value = aws_vpc.vpc.cidr_block
}

output "subnet_id" {
  value = aws_subnet.public_subnet.*.id
}
output "subnet_ip" {
  value = aws_subnet.public_subnet.*.cidr_block
}

output "ec2_public_ip" {
  value = [aws_instance.webserver.*.public_ip, aws_instance.jenkins.*.public_ip]
}
output "ec2_private_ip" {
  value = [aws_instance.webserver.*.private_ip, aws_instance.jenkins.*.private_ip]
}
