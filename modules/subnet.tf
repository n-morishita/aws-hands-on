resource "aws_subnet" "public" {
  for_each          = var.public_subnet_map
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = "ap-northeast-1${each.value.az}"

  tags = {
    Name = "public-subnet-${each.value.az}"
  }
}

resource "aws_subnet" "private" {
  for_each          = var.private_subnet_map
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = "ap-northeast-1${each.value.az}"
  tags = {
    Name = "private-subnet-${each.value.az}"
  }
}
