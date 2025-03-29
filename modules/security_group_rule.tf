resource "aws_security_group_rule" "egress_web" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}

# resource "aws_security_group_rule" "ingress_web" {
#   type = "ingress"
#   from_port = 0
#   to_port = 0
#   protocol = "-1"
#   cidr_blocks = [""] # 特定のIPからのアクセスを受け付ける場合は有効化
#   security_group_id = aws_security_group.web.id
# }
