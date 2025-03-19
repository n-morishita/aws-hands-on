# Subnet variables
variable "public_subnet_map" {
  type = map(object({
    cidr_block = string
    az         = string
  }))
}

variable "private_subnet_map" {
  type = map(object({
    cidr_block = string
    az         = string
  }))
}