# Web app
resource "aws_security_group_rule" "ingress_web" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.11.0/24"]
  security_group_id = aws_security_group.web.id
}

resource "aws_security_group_rule" "egress_web" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}

# VPC endpoint
resource "aws_security_group_rule" "ingress_vpc_endpoint" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["10.0.11.0/24"]
  security_group_id = aws_security_group.vpc_endpoint.id
}

resource "aws_security_group_rule" "egress_vpc_endpoint" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc_endpoint.id
}
