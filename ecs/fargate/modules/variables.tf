variable "app_name" {
  description = "Application name"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

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

# ALB / Service additions
variable "health_check_path" {
  type        = string
  default     = "/"
  description = "HTTP health check path for target group"
}

variable "listener_port" {
  type        = number
  default     = 80
  description = "ALB listener port"
}