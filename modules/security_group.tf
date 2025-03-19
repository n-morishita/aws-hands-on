resource "aws_security_group" "web" {
  name   = "study-web-sg"
  vpc_id = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ingress {
  #   from_port       = 0
  #   to_port         = 0
  #   protocol        = "-1"
  #   cidr_blocks     = [""]　# 特定のIPからのアクセスを受け付ける場合は有効化
  # }

  tags = {
    Name = "study-web-sg"
  }
}
