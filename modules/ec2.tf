# webサーバー (public)
# resource "aws_instance" "web" {
#   ami                    = "ami-0a1c2ec61571737db"
#   instance_type          = "t2.small"
#   subnet_id              = aws_subnet.public["az_a"].id
#   vpc_security_group_ids = [aws_security_group.web.id]
#   user_data = "../user_data/app-setup.sh"

#   tags = {
#     Name = "study-web"
#   }
# }

# webサーバー (private)
resource "aws_instance" "web" {
  ami                    = "ami-0a1c2ec61571737db"
  instance_type          = "t2.small"
  subnet_id              = aws_subnet.private["az_a"].id
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = file("${path.module}/user_data/app-setup.sh")
  iam_instance_profile   = aws_iam_instance_profile.ssm_instance_profile.name

  tags = {
    Name = "study-web"
  }
}
