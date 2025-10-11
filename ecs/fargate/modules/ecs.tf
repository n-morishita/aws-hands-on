# ECS クラスター
resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-cluster"
}

# resource "aws_ecs_cluster_capacity_providers" "main" {
#   cluster_name = aws_ecs_cluster.main.name

#   capacity_providers = ["FARGATE"]

#   default_capacity_provider_strategy {
#     capacity_provider = "FARGATE"
#     weight            = 1
#   }
# }


# ECS タスク定義
# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html
resource "aws_ecs_task_definition" "app" {
  family                   = "${var.app_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = templatefile("${path.module}/task-definition/service.json.tpl", {
    app_name       = var.app_name
    container_port = var.container_port
    log_group_name = aws_cloudwatch_log_group.ecs.name
    repository_url = aws_ecr_repository.app.repository_url
  })
}

# ECS サービス
resource "aws_ecs_service" "app" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  network_configuration {
    subnets          = [for s in aws_subnet.private : s.id]
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app.arn
    container_name   = "${var.app_name}-container"
    container_port   = var.container_port
  }

  depends_on = [aws_lb_listener.http]
}