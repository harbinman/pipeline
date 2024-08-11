resource "aws_instance" "jenkins" {
  depends_on                  = [aws_key_pair.jenkins]
  instance_type               = "t2.large"
  ami                         = "ami-0497a974f8d5dcef8"
  security_groups             = ["sg-00467812237ecf509"]
  subnet_id                   = "subnet-074087e9ecf20fb88"
  associate_public_ip_address = true
  key_name = resource.aws_key_pair.jenkins
  root_block_device {
    volume_size = 20
  }
  tags = {
    Name = "jenkins"
  }
  user_data = {

  }
}


resource "aws_key_pair" "jenkins" {
  key_name   = "jenkins-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDESJThF/NiZWzzSY/idM7AHXKaEVgJ0OXVWBPDyLHsB+x8gsMYn128n43LMdAU1I1/OKJKpIIyEH6YlfTIWZIhCDQDA/+9cmsgh7pJypIDlfg2+yyd/XHMzdywtTzwK2R8IzKy6fyIvtuR5KDYgqZiP5i+r7+o9+Njwa541X9o1+bUBm0Ek+er75g8slk75hwSxrd6fB+WxBNLS11VNzf4EkZM1yAEbzn7KiFGCXkPDZKBBLI0g/QBRrPtnsAYXSK9iVTxL/hE47BLxEY/NpiSkr719JfQBL+Y4UaDoTQVSc2WGyILL1mc6t+6SrXpG0oq/SqpZciCrLZMt2CN8E9RfmT8Z+cjrsJpLSIkVB2pI7cPHKtdBRoR4hT084I7WGIlzheex37dlgO6aesEU7XNtGp6z9KR3zEwCOi1pWD/mCp9cQtxTLrJOtxOHTUL/gCKurqHiqp5lZ2OOywKpix8rkR/ahLRay0Vasf4DyEVRjHDaE/R+LTRdhm1zTC9mn0= administrator@Win10-2023PPSOW"
}
