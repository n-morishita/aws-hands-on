resource "aws_security_group" "web" {
  name   = "study-web-sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "study-web-sg"
  }
}
