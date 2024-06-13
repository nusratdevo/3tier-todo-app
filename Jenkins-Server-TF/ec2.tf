resource "aws_instance" "ec2" {
  ami                    = "ami-04b70fa74e45c3917"
  instance_type          = "t2.large"
  key_name               = "devops"
  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  iam_instance_profile   = aws_iam_instance_profile.instance-profile.name
  root_block_device {
    volume_size = 30
  }
  user_data = templatefile("./tools-install.sh", {})

  tags = {
    Name = "three-tier-app"
  }
}