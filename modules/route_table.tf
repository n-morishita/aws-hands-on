resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "study-public-route"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_a_route" {
  subnet_id      = aws_subnet.public["az_a"].id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "public_c_route" {
  subnet_id      = aws_subnet.public["az_c"].id
  route_table_id = aws_route_table.public_route.id
}


resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "study-private-route"
  }
}

# resource "aws_route" "private_route_nat" {
#   route_table_id         = aws_route_table.private_route.id
#   nat_gateway_id         = aws_nat_gateway.nat_gateway.id
#   destination_cidr_block = "0.0.0.0/0"
# }

# resource "aws_route_table_association" "private_a_route" {
#   subnet_id      = aws_subnet.private["az_a"].id
#   route_table_id = aws_route_table.private_route.id
# }

# resource "aws_route_table_association" "private_c_route" {
#   subnet_id      = aws_subnet.private["az_c"].id
#   route_table_id = aws_route_table.private_route.id
# }