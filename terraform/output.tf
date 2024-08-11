output "ec2_public_ip" {
  value = resource.aws_instance.jenkins.public_ip
}