module "modules" {
  source = "./modules"

  app_name = "sample-ecs-app"

  #subnet
  public_subnet_map = {
    az_a = {
      cidr_block = "10.0.1.0/24"
      az         = "a"
    }
    az_c = {
      cidr_block = "10.0.2.0/24"
      az         = "c"
    }
  }
  private_subnet_map = {
    az_a = {
      cidr_block = "10.0.11.0/24"
      az         = "a"
    }
    az_c = {
      cidr_block = "10.0.12.0/24"
      az         = "c"
    }
  }
}
