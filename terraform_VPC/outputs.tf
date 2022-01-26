# Output VPC CIDR
output "vpc_ip" {
  value = module.vpc.vpc_ip
}
# Output Subnet CIDR
output "subnet_ip" {
  value = module.vpc.subnet_ip
}

# Output IP`s
# Output Public IP of APP
output "app_public_ip" {
  value = module.ec2.app_public_ip
}
# Output Public IP of Jenkins
output "jenkins_public_ip" {
  value = module.ec2.jenkins_public_ip
}
# Output Private IP of APP
output "app_private_ip" {
  value = module.ec2.app_private_ip
}
# Output Private IP of Jenkins
output "jenkins_private_ip" {
  value = module.ec2.jenkins_private_ip
}
