resource "aws_security_group" "web" {
  name   = "study-web-sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "study-web-sg"
  }
}

resource "aws_security_group" "vpc_endpoint" {
  name   = "study-vpc-endpoint-sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "study-vpc-endpoint-sg"
  }
}